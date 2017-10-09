import 'package:angular/angular.dart';

import '../../firebase_service.dart';
import '../../model/note.dart';

@Component(
    selector: 'notes',
    templateUrl: 'notes_component.html',
    directives: const [CORE_DIRECTIVES])
class NotesComponent implements OnInit {
  final FirebaseService service;
  List<Note> notes = [];

  NotesComponent(this.service);

  @override
  ngOnInit() {
    notes = service.notes;
  }
}
