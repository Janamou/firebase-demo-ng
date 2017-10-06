import 'package:angular/angular.dart';

import '../../firebase_service.dart';
import '../../model/note.dart';

@Component(
    selector: 'notes',
    templateUrl: 'note_component.html',
    directives: const [CORE_DIRECTIVES])
class NoteComponent implements OnInit {
  final FirebaseService service;
  List<Note> notes;

  NoteComponent(this.service);

  @override
  ngOnInit() {
    notes = service.notes;
  }
}
