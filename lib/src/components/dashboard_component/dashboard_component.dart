import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_router/angular_router.dart';

import '../../../routes.dart' as route;

@Component(
  selector: 'dashboard',
  template:
      '<h1>Dashboard</h1><material-button [routerLink]="userCreateRoute">Create user</material-button>',
  directives: const [
    MaterialButtonComponent,
    RouterLink,
  ],
)
class DashboardComponent {
  String userCreateRoute = route.userCreateRouteExternal.toUrl();
}
