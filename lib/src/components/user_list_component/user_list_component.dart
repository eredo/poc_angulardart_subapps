import 'package:angular/angular.dart';

@Component(
  selector: 'user-list',
  template: '''
  <h2>User list</h2>
  <ul>
    <li>User 1</li><li>User 2</li>
  </ul>
  ''',
)
class UserListComponent {}
