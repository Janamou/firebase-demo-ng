import 'package:angular/angular.dart';

import 'src/component/note/new_note_component.dart';
import 'src/component/note/notes_component.dart';
import 'src/component/footer/footer_component.dart';
import 'src/component/header/header_component.dart';
import 'src/firebase_service.dart';

@Component(
    selector: 'my-app',
    styleUrls: const ['app_component.css'],
    templateUrl: 'app_component.html',
    directives: const [
      CORE_DIRECTIVES,
      HeaderComponent,
      FooterComponent,
      NotesComponent,
      NewNoteComponent
    ],
    providers: const [FirebaseService])
class AppComponent implements OnInit {
  final FirebaseService service;

  AppComponent(this.service);

  @override
  ngOnInit() {
    service.init();
  }
}
