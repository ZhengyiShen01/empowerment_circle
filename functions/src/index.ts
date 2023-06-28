import {onDocumentWritten} from "firebase-functions/v2/firestore";
import {initializeApp} from "firebase-admin/app";
import {getFirestore, FieldValue} from "firebase-admin/firestore";

initializeApp();
const db = getFirestore();

exports.updateOnNoteChange = onDocumentWritten(
  "notes/{noteId}",
  async (event) => {
    const noteData = event?.data?.after?.data();
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
            isAssigned: FieldValue.arrayUnion(noteData.owner),
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
