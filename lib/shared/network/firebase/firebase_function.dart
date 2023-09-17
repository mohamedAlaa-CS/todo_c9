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
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('dateTime',
            isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> deletTask(String? id) {
    return getCollection().doc(id).delete();
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
      Navigator.pushNamedAndRemoveUntil(
          context, LoginView.routeName, (route) => false);
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
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushNamedAndRemoveUntil(
          context, HomeLayoutView.routeName, (route) => false);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Wrong Email or Password..',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ));
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
}
