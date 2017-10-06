import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'src/component/note/new_note_component.dart';
import 'src/component/note/note_component.dart';
import 'src/component/footer/footer_component.dart';
import 'src/component/header/header_component.dart';
import 'src/firebase_service.dart';

@Component(
    selector: 'my-app',
    styleUrls: const ['app_component.css'],
    templateUrl: 'app_component.html',
    directives: const [
      materialDirectives,
      HeaderComponent,
      FooterComponent,
      NoteComponent,
      NewNoteComponent
    ],
    providers: const [FirebaseService])
class AppComponent implements OnInit {
  final FirebaseService _service;

  AppComponent(this._service);

  @override
  ngOnInit() {
    _service.init();
  }
}
