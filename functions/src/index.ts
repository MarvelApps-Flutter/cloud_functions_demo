import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import * as sgMail from "@sendgrid/mail";

admin.initializeApp();

const API_KEY = functions.config().sendgrid.key;
sgMail.setApiKey(API_KEY);

// exports.sendEmailToUser = functions.https.onCall((request, response)=> {
//   console.log("email", mails);
//   const msg = {
//     to: mails,
//     from: "poonam.kalra@successive.tech",
//     subject: "Test",
//     text: "Test mail from sendgrid",
//   };
//   sgMail
//       .send(msg)
//       .then((response) => {
//         console.log(response[0].statusCode);
//         console.log(response[0].headers);
//       })
//       .catch((error) => {
//         console.error(`Unable to send email. Error: ${error}`);
//         throw new functions.https.HttpsError("aborted", "error");
//       });
//   return `Email sent successfully to ${msg.to}`;
// });

// exports.createFunss = functions.firestore.document("data/1")
//     .onCreate(async (snap, context) => {
//       const datas = {
//         "data": "11",
//       };
//       await admin.firestore().collection("data").add(datas);
//     });

// exports.createFunss = functions.https.onCall((request, response)=> {
//   return "Hello from Firebase!";
// });

exports.registerUserData = functions.https.onCall(async (request, response)=>{
  try {
    await admin.firestore().collection("data").add({
      "userName": request.userName,
      "email": request.email,
      "password": request.password,
    });
    const msg = {
      to: request.email,
      from: "poonam.kalra@successive.tech",
      subject: "Registration confirmation",
      text: "Your registration has been confirmed successfully",
    };
    sgMail
        .send(msg)
        .then((response) => {
          console.log(response[0].statusCode);
          console.log(response[0].headers);
        })
        .catch((error) => {
          console.error(`Unable to send email. Error: ${error}`);
          throw new functions.https.HttpsError("aborted", "error");
        });
    return "Registration has been done & acknowledged through mail as well";
  } catch (err) {
    console.log(err);
    return err;
  }
});

