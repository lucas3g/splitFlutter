import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:split_it/shared/models/base_model.dart';

class FirebaseRepository<T extends BaseModel> {
  FirebaseFirestore get fireStore => FirebaseFirestore.instance;

  Future<String> create(T data) async {
    try {
      final response =
          await fireStore.collection(data.collection).add(data.toMap());
      return response.id;
    } catch (e) {
      throw e;
    }
  }

  Future<bool> update(
      {required String id,
      required String collectin,
      required BaseModel model}) async {
    try {
      await this.fireStore.collection(collectin).doc(id).update(model.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> get(
      {String collection = '',
      String orderBy = '',
      bool descending = false}) async {
    try {
      final response = await this
          .fireStore
          .collection(collection)
          .orderBy(orderBy, descending: descending)
          .get();
      return response.docs.map((e) => e.data()..addAll({'id': e.id})).toList();
    } catch (e) {
      throw e;
    }
  }

  Future<bool> delete({required String id, required String collection}) async {
    try {
      await this.fireStore.collection(collection).doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> where(
      {required String key,
      required String value,
      required String collection}) async {
    try {
      final response = await fireStore
          .collection(collection)
          .where(key, isEqualTo: value)
          .get();
      return response.docs.map((e) => e.data()).toList();
    } catch (e) {
      throw e;
    }
  }

  Future<bool> findUser({required String email}) async {
    try {
      final response = await fireStore
          .collection('/users')
          .where('email', isEqualTo: email)
          .get();
      if (response.docs.map((e) => e.data()).isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  firstWhere() {}
}
