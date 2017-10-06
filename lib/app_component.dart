import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:firebase/firebase.dart' as fb;

import 'src/component/header/header_component.dart';
import 'src/firebase_service.dart';

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [materialDirectives, HeaderComponent],
  providers: const [FirebaseService]
)
class AppComponent implements OnInit {
  FirebaseService _service;

  AppComponent(this._service);

  @override
  ngOnInit() {
    _service.initData();
  }
}
