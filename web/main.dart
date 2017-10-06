import 'package:angular/angular.dart';
import 'package:firebase/firebase.dart';

import 'package:firebase_demo_ng/app_component.dart';

void main() {
  initializeApp(
      apiKey: "",
      authDomain: "",
      databaseURL: "",
      //projectId: "",
      storageBucket: ""
      //messagingSenderId: ""
      );

  bootstrap(AppComponent);
}
