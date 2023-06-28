/* eslint-disable camelcase */
import {
  onDocumentCreated,
  onDocumentWritten,
} from "firebase-functions/v2/firestore";
import {initializeApp} from "firebase-admin/app";
import {getFirestore, FieldValue} from "firebase-admin/firestore";
import {getStorage} from "firebase-admin/storage";
// import serviceAccount from "./path/to/serviceAccountKey.json";

import axios from "axios";

initializeApp();
const db = getFirestore();

exports.updateMemeberAndCreateNotificationOnNoteCreated = onDocumentCreated(
  "notes/{noteId}",
  async (event) => {
    const noteData = event?.data?.data();
    if (noteData) {
      const taskRef = noteData.taskRef;
      const taskDoc = await taskRef.get();
      const taskData = taskDoc.data();

      if (taskData) {
        await taskRef.update({
          members: FieldValue.arrayUnion(noteData.owner),
        });

        const projectRef = taskData.projectRef;
        const projectDoc = await projectRef.get();
        const projectData = projectDoc.data();
        if (projectData) {
          await projectRef.update({
            usersAssigned: FieldValue.arrayUnion(noteData.owner),
          });

          const newActivity = {
            activityName: "Note Created",
            activitySubText: "has left a note on ",
            activityDescription: noteData.note,
            activityTime: new Date(),
            activityType: taskData.taskName,
            otherUser: noteData.owner,
            projectRef: projectRef,
            targetUserRef: taskData.members,
            unreadByUser: taskData.members,
          };

          db.collection("activity")
            .add(newActivity)
            .then((docRef) => {
              console.log("Document written with ID: ", docRef.id);
            })
            .catch((error) => {
              console.error("Error adding document: ", error);
            });
        }
      }
    }
  }
);

exports.updateUserConnectionsOnConnectionCreated = onDocumentCreated(
  "connections/{connectionsId}",
  async (event) => {
    const connectionData = event.data?.data();
    const receiverRef = connectionData?.receiver;
    const senderRef = connectionData?.sender;

    await receiverRef.update({
      connections: FieldValue.arrayUnion(senderRef),
    });

    await senderRef.update({
      connections: FieldValue.arrayUnion(receiverRef),
    });
  }
);

exports.generateLetterAvatarOnUserCreated = onDocumentWritten(
  "users/{userId}",
  async (event) => {
    const userDoc = event.data?.after;
    const userRef = userDoc?.ref;
    const userData = userDoc?.data();

    const photo_url = userData?.photo_url;
    const display_name = userData?.display_name?.replace(/ /g, "+");

    if (!photo_url) {
      const url = `https://ui-avatars.com/api/?name=${display_name}`;
      const response = await axios.get(url, {responseType: "arraybuffer"});

      const filePath = `/profile_images/${event.params.userId}.png`;
      const bucket = getStorage().bucket();
      const file = bucket.file(filePath);
      await file.save(response.data, {
        metadata: {contentType: "image/png"},
      });

      await userRef?.update({photo_url: file.publicUrl()});
    }
  }
);
