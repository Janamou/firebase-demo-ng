# AngularDart + Firebase = ♥ demo

Demo app for my talk at DevFest Ukraine 2017 and DevFest CZ 2017. The application is written in [AngularDart](https://webdev.dartlang.org/angular) and uses the [Firebase library](https://github.com/firebase/firebase-dart/).

![Dart + Firebase App](https://github.com/Janamou/firebase-demo-ng/blob/master/app.png)

## Before running

### Your credentials

Before running the app, update the `web/main.dart` file with your Firebase project's credentials:

```dart
initializeApp(
      apiKey: "TODO",
      authDomain: "TODO",
      databaseURL: "TODO",
      storageBucket: "TODO");
```

### Google login

Enable Google login in Firebase console under the `Authentication/Sign-in method`.

### Database rules

Set database rules on who can access the database under the `Database/Rules`. More info on [Database rules](https://firebase.google.com/docs/database/security/).

For example:

```json
{
  "rules": {
    ".read": true,
    ".write": "auth != null"
  }
}
```

### Storage rules

Set storage rules on who can access the storage under the `Storage/Rules`. More info on [Storage rules](https://firebase.google.com/docs/storage/security/).

For example:

```
service firebase.storage {
  match /b/<YOUR_STORAGE_BUCKET>/o {
    match /{allPaths=**} {
      allow read;
      allow write: if request.auth != null;
    }
  }
}
```
