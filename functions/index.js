const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

const db = admin.firestore();

exports.confirmFriendship = functions.firestore
  .document("friend_requests/{friendRequestId}")
  .onUpdate(async (change, context) => {
    const previousData = change.before.data();
    const currentData = change.after.data();
    if (currentData.status == "Accepted" && previousData.status == "Pending") {
      const storyRef = currentData.story_ref;
      const contactRef = currentData.contact_ref;
      try {
        const contactDoc = await contactRef.get();

        const data = contactDoc.data();
        const updatedData = { ...data, is_friend: true, story_ref: storyRef };

        await contactRef.set(updatedData, { merge: true });
      } catch (error) {
        functions.logger.error(error);
      }
    }
  });

exports.onStoryNewsCreated = functions.firestore
  .document("story_news/{storyNewsId}")
  .onCreate(async (snapshot, context) => {
    const data = snapshot.data();
    const users = data.send_to;
    const storyRef = data.story_ref;
    const storyDoc = await storyRef.get();
    const storyData = storyDoc.data();
    const receivers = storyData.receivers || [];

    const newReceivers = users.filter(
      (user) => !receivers.some((receiver) => receiver.path === user.path) // select only new users
    );

    if (!newReceivers || newReceivers.length === 0) {
      return;
    }

    const updatedReceivers = [...receivers, ...newReceivers];

    newReceivers.map(async (user) => {
      try {
        functions.logger.info("User: ", user.id);
        const userNewsCollection = db.collection(`users/${user.id}/news`);
        await userNewsCollection.add({
          title: storyData.title,
          created_by: storyData.created_by,
          created_at: storyData.created_at,
          story_type: storyData.type,
          story_ref: storyRef,
          archive: false,
        });
      } catch (error) {
        functions.logger.error(error);
      }
    });

    await storyRef.set({ receivers: updatedReceivers }, { merge: true });
  });

exports.onSharedStoryCreated = functions.firestore
  .document("shared_stories/{sharedStoryId}")
  .onCreate(async (snapshot, context) => {
    const data = snapshot.data();
    const db = admin.firestore();

    // Get the story data and the list of contacts to share with
    const storyRef = db.doc(data.story_ref.path);
    const storyDoc = await storyRef.get();
    const storyData = storyDoc.data();
    const createdBy = storyData.created_by;
    const involvedBy = storyData.involved_by;

    if (!involvedBy || involvedBy.length === 0) {
      return;
    }

    // Get the current user's contacts that are in the provided list
    const currentUserRef = db.doc(createdBy.path);
    const contactsQuery = currentUserRef
      .collection("contacts")
      .where("user_ref", "in", involvedBy)
      .where("is_friend", "==", true);
    const contactsSnapshot = await contactsQuery.get();

    // Batch write story information into each shared stories
    const batch = db.batch();

    for (const contactDoc of contactsSnapshot.docs) {
      functions.logger.info(contactDoc.data().display_name);
      const sharedStoryRef = contactDoc.data().story_ref;
      functions.logger.info(sharedStoryRef);
      const messageRef = sharedStoryRef.collection("messages").doc();

      // Set the message data with the provided story
      batch.set(messageRef, {
        content: storyData.title,
        created_by: storyData.created_by,
        created_at: storyData.created_at,
        story_type: storyData.type,
        story_ref: storyRef,
      });
    }

    await batch.commit();
  });
