
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/models/task_model.dart';

class FirebaseFunction
{
static CollectionReference<TaskModel> getCollection(){
  return FirebaseFirestore
  .instance
  .collection(TaskModel.collectionName)
  .withConverter<TaskModel>(
    fromFirestore: (snapshot, _) =>TaskModel.fromfireStore(snapshot.data()!) ,
     toFirestore: (taskModel, options) =>taskModel.toFireStore(),);
}

 static Future<void> addTask(TaskModel taskModel)async{
  var collection = getCollection();
  var doc = collection.doc();
  taskModel.id = doc.id;
  doc.set(taskModel);
}
static Stream<QuerySnapshot<TaskModel>> getData(){
 return getCollection() .orderBy('dateTime')
                .snapshots();
}

static Future<void> deletTask(String? id){
 return getCollection().doc(id).delete();
}
}