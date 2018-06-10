import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';

@Component(
  selector: 'groups-app',
  templateUrl: 'groups_app_component.html',
  directives: const [MaterialButtonComponent],
)
class GroupsAppComponent {
  String test = 'hello';
}
