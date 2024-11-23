import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/models/task_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> gitTaskCollection() =>
      FirebaseFirestore.instance.collection('tasks').withConverter<TaskModel>(
            fromFirestore: (docSnapshot, options) =>
                TaskModel.fromJson(docSnapshot.data()!),
            toFirestore: (taskModel, _) => taskModel.toJson(),
          );
  static Future<void> addTaskToFireStore(TaskModel task) async {
    CollectionReference<TaskModel> tasksCollection = gitTaskCollection();
    DocumentReference<TaskModel> doc = tasksCollection.doc();
    task.id = doc.id;
    return doc.set(task);
  }

  static Future<List<TaskModel>> gitTaskFromFireStore() async {
    CollectionReference<TaskModel> tasksCollection = gitTaskCollection();
    QuerySnapshot<TaskModel> querySnapshot = await tasksCollection.get();
    return querySnapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }

  static Future<void> deleteTaskFromFirebase(String taskId) async {
    CollectionReference<TaskModel> tasksCollection = gitTaskCollection();
    return tasksCollection.doc(taskId).delete();
  }
}
