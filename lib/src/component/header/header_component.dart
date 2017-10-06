import 'package:angular/angular.dart';

import '../../firebase_service.dart';

@Component(
    selector: 'layout-header',
    templateUrl: 'header_component.html',
    directives: const [CORE_DIRECTIVES])
class HeaderComponent {
  final FirebaseService service;
  HeaderComponent(this.service);
}
