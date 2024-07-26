import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  Future<void> saveOrderToDatabase(String receipt) async {
    try {
      await orders.add({
        'date': DateTime.now(),
        'order': receipt,
      });
    } catch (e) {
      throw Exception('Error adding order to Firestore: $e');
    }
  }
}
