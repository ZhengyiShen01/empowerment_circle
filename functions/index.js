const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

const db = admin.firestore();

exports.confirmFriendship = functions.firestore
  .document("friend_requests/{requestId}")
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

exports.spreadNewStory = functions.firestore
  .document("stories/{storyId}")
  .onWrite(async (change, context) => {
    // ToDo: change to onCreate
    const doc = change.after;
    const data = doc.data();
    const receivers = data.receivers || [];
    const users = data.visible_to; // ToDo: rename to `send_to`

    if (doc.exists && users && users.length > 0) {
      const newReceivers = users.filter(
        (user) => !receivers.some((receiver) => receiver.path === user.path) // select only new users
      );
      const updatedReceivers = [...receivers, ...newReceivers];

      newReceivers.map(async (user) => {
        try {
          const userNewsCollection = db.collection(`users/${user.id}/news`);
          await userNewsCollection.add({
            title: data.title,
            created_by: data.created_by,
            created_at: data.created_at,
            type: data.type,
            story_ref: doc.ref,
          });
        } catch (error) {
          functions.logger.error(error);
        }
      });

      await doc.ref.set(
        { visible_to: [], receivers: updatedReceivers },
        { merge: true }
      );
    }
  });
