import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:firebase/firebase.dart' as fb;

import '../src/model/note.dart';

@Injectable()
class FirebaseService {
  final fb.Auth auth;
  final fb.DatabaseReference databaseRef;
  final fb.StorageReference storageRef;
  final List<Note> notes = [];
  fb.User user;

  FirebaseService()
      : auth = fb.auth(),
        databaseRef = fb.database().ref("notes"),
        storageRef = fb.storage().ref("notes");

  init() {
    databaseRef.onChildAdded.listen((e) {
      // Snapshot of the data.
      fb.DataSnapshot data = e.snapshot;

      // Value of data from snapshot.
      var val = data.val();
      // Creates a new Note item. It is possible to retrieve a key from data.
      var item = new Note(
          val[jsonTagText], val[jsonTagTitle], val[jsonTagImgUrl], data.key);
      notes.insert(0, item);
    });

    // Setups listening on the child_removed event on the database ref.
    databaseRef.onChildRemoved.listen((e) {
      fb.DataSnapshot data = e.snapshot;
      var val = data.val();

      // Removes also the image from storage.
      var imageUrl = val[jsonTagImgUrl];
      if (imageUrl != null) {
        removeItemImage(imageUrl);
      }
      notes.removeWhere((n) => n.key == data.key);
    });

    auth.onIdTokenChanged.listen((e) {
      user = e;
    });
  }

  // Pushes a new item as a Map to database.
  postItem(Note item) async {
    try {
      await databaseRef.push(Note.toMap(item)).future;
    } catch (e) {
      print("Error in writing to database: $e");
    }
  }

  // Removes item with a key from database.
  removeItem(String key) async {
    try {
      await databaseRef.child(key).remove();
    } catch (e) {
      print("Error in deleting $key: $e");
    }
  }

  // Puts image into a storage.
  postItemImage(File file) async {
    try {
      var snapshot = await storageRef.child(file.name).put(file).future;
      return snapshot.downloadURL;
    } catch (e) {
      print("Error in uploading to database: $e");
    }
  }

  // Removes image with an imageUrl from the storage.
  removeItemImage(String imageUrl) async {
    try {
      var imageRef = fb.storage().refFromURL(imageUrl);
      await imageRef.delete();
    } catch (e) {
      print("Error in deleting $imageUrl: $e");
    }
  }

  // Logins with the Google auth provider.
  loginWithGoogle() async {
    var provider = new fb.GoogleAuthProvider();
    try {
      await auth.signInWithPopup(provider);
    } catch (e) {
      print("Error in sign in with google: $e");
    }
  }

  signOut() async {
    await auth.signOut();
  }
}
