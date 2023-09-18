import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/models/user_model.dart';

import '../../../layout/home_layout.dart';
import '../../../screens/login/login_view.dart';

class FirebaseFunction {
  static CollectionReference<TaskModel> getCollection() {
    return FirebaseFirestore.instance
        .collection(TaskModel.collectionName)
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) =>
              TaskModel.fromfireStore(snapshot.data()!),
          toFirestore: (taskModel, options) => taskModel.toFireStore(),
        );
  }

  static Future<void> addTask(TaskModel taskModel) async {
    var collection = getCollection();
    var doc = collection.doc();
    taskModel.id = doc.id;
    doc.set(taskModel);
  }

  static Stream<QuerySnapshot<TaskModel>> getData(DateTime date) {
    return getCollection()
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .where('dateTime',
            isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> deletTask(String? id) {
    return getCollection().doc(id).delete();
  }

  static Future<void> updateIsDone(TaskModel taskModel) {
    return getCollection()
        .doc(taskModel.id)
        .update({'isDone': !taskModel.isDone!});
  }

  static Future<void> updateTask({required TaskModel taskModel}) {
    return getCollection().doc(taskModel.id).update(taskModel.toFireStore());
  }

  static Future<void> signUp(
      String email, String password, context, String? name, String? age) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel userModel = UserModel(
        name: name,
        age: age,
        email: email,
      );
      var collection = getUserCollection();
      var doc = collection.doc(credential.user!.uid);
      userModel.id = credential.user!.uid;
      doc.set(userModel);
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
      aweSomeDialog(
          context: context,
          dialogType: DialogType.success,
          text: 'Success',
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushNamedAndRemoveUntil(
                context, LoginView.routeName, (route) => false);
          },
          title: 'Success');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'The password provided is too weak.',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'The account already exists for that email.',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
        ));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> sigIn(String email, String password, context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      FirebaseAuth.instance.currentUser!.emailVerified
          ? Navigator.pushNamedAndRemoveUntil(
              context, HomeLayoutView.routeName, (route) => false)
          : aweSomeDialog(
              context: context,
              dialogType: DialogType.warning,
              text: 'go to gmail and verivied your email..',
              onPressed: () {},
              title: 'Warning');
    } on FirebaseAuthException catch (e) {
      aweSomeDialog(
          context: context,
          dialogType: DialogType.error,
          text: 'Wrong Email or Password..',
          onPressed: () {},
          title: 'Error');
      print(e.toString());
    }
  }

  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter<UserModel>(
            fromFirestore: (snapshot, _) =>
                UserModel.fromFirestore(snapshot.data()!),
            toFirestore: (usermodel, option) => usermodel.toFireStore());
  }

  static void showSnackBar(
    context,
    String text,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        style: const TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.blue,
    ));
  }

  static void aweSomeDialog(
      {context,
      required dialogType,
      required String text,
      void Function()? onPressed,
      required String title}) {
    AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: dialogType,
            title: title,
            titleTextStyle: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            descTextStyle: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18,
                fontWeight: FontWeight.w500),
            desc: text,
            btnOkColor:
                dialogType == DialogType.success ? Colors.blue : Colors.red,
            btnOkOnPress: onPressed,
            dismissOnTouchOutside: false)
        .show();
  }
}
