const functions = require("firebase-functions");
const admin = require("firebase-admin");
const {Translate} = require("@google-cloud/translate").v2;

admin.initializeApp();

const translate = new Translate();

exports.translateFunction = functions.firestore
    .document("Tasks/{taskId}")
    .onCreate(async (snapshot, context) => {
      const data = snapshot.data();

      if (data.title && data.description) {
        const titleTask = `${data.title}`;
        const descriptionTask = `${data.description}`;
        try {
          const [titleEnglish] =
            await translate.translate(titleTask, "en");
          const [descriptionEnglish] =
            await translate.translate(descriptionTask, "en");
          const translationData = {
            titleEnglish: titleEnglish,
            descriptionEnglish: descriptionEnglish
          };
          return snapshot.ref.update({taskEnglish: translationData});
        } catch (error) {
          return null;
        }
      } else {
        return null;
      }
    });
