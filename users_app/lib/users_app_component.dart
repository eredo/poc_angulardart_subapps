import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:shared_lib/child_application.dart';

import 'routes.dart' as route;

// ignore: uri_has_not_been_generated
import 'src/user_list_component/user_list_component.template.dart'
    as list;
// ignore: uri_has_not_been_generated
import 'src/user_create_component/user_create_component.template.dart'
    as create;

@Component(
  selector: 'users-app',
  template: '''<h1>Users app</h1>
  <a [routerLink]="listRoute">list users</a>
  <a [routerLink]="createRoute">create an user</a>
  <router-outlet [routes]="routes"></router-outlet>  
  ''',
  directives: const [
    RouterOutlet,
    RouterLink,
  ],
  providers: const [
    const Provider(appBaseHref, useValue: '/users/'),
    routerProviders,
  ],
)
class UserAppComponent extends ChildApplication {
  String createRoute = route.userCreateRoute.toUrl();
  String listRoute = route.userListRoute.toUrl();

  final List<RouteDefinition> routes = [
    new RouteDefinition(
      routePath: route.userListRoute,
      component: list.UserListComponentNgFactory,
      useAsDefault: true,
    ),
    new RouteDefinition(
      routePath: route.userCreateRoute,
      component: create.UserCreateComponentNgFactory,
    ),
  ];

  UserAppComponent(@Inject(appBaseHref) String baseUri, Router router)
      : super('users', baseUri, router);
}
