import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

@Component(
  selector: 'groups-app',
  template: '<h1>Groups app</h1><material-button>test button</material-button>',
  directives: const [MaterialButtonComponent],
  providers: const [materialProviders],
)
class GroupsAppComponent {}
