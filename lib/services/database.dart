import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/shared/brew_object.dart';
import 'package:flutter_application_1/models/user.dart';

class DatabaseService {
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  final String uid;
  DatabaseService({required this.uid});

  // insert data
  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // print data
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map((QuerySnapshot snapshot) {
      try {
        return snapshot.docs.map((doc) {
          return Brew(
            name: doc.get("name") ?? "",
            sugars: doc.get("sugars") ?? "0",
            strength: doc.get("strength") ?? 0,
          );
        }).toList();
      } catch (e) {
        print(e.toString());
        return [];
      }
    });
  }

  // get user doc stream
  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots().map((DocumentSnapshot snapshot) {
      return UserData(
          uid: uid,
          name: snapshot['name'],
          sugars: snapshot['sugars'],
          strength: snapshot['strength']);
    });
  }
}
