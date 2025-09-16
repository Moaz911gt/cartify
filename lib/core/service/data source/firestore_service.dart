import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getDataFromSubCollection(
    String mainId,
    String mainPath,
    String subPath,
  ) async {
    var res = await _firestore
        .collection(mainPath)
        .doc(mainId)
        .collection(subPath)
        .get();
    return res.docs.map((e) {
      return e.data();
    }).toList();
  }

  Future<void> addDataToSubCollection(
    String mainId,
    String subId,
    String mainPath,
    String subPath,
    Map<String, dynamic> data,
  ) async {
    await _firestore
        .collection(mainPath)
        .doc(mainId)
        .collection(subPath)
        .doc(subId)
        .set(data);
  }

  Future<void> deleteDataToSubCollection(
    String mainId,
    String subId,
    String mainPath,
    String subPath,
  ) async {
  await  _firestore
        .collection(mainPath)
        .doc(mainId)
        .collection(subPath)
        .doc(subId)
        .delete();
  }
}
