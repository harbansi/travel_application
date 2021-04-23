import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

class CrudMethods {
  Future<void> addData(blogData) async {
    FirebaseFirestore.instance
        .collection("blogs")
        .add(blogData)
        .catchError((e) {
      print(e);
    });
  }

  getData() async {
    return await FirebaseFirestore.instance.collection("blogs").snapshots();
  }

  Future<void> addDetails(destinationData) async {
    FirebaseFirestore.instance
        .collection("destination")
        .add(destinationData)
        .catchError((e) {
      print(e);
    });
  }

  getdetails() async {
    return await FirebaseFirestore.instance
        .collection("destination")
        .snapshots();
  }

  final CollectionReference blogRef =
      FirebaseFirestore.instance.collection("blog");
}
