import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_components/angular_components.dart';

import 'routes.dart' as route;

// ignore: uri_has_not_been_generated
import 'src/components/dashboard_component/dashboard_component.template.dart'
    as dashboard;
// ignore: uri_has_not_been_generated
import 'src/components/child_app_component/child_app_component.template.dart'
    as child;

@Component(
  selector: 'hack-app',
  templateUrl: 'app_component.html',
  directives: const [
    RouterOutlet,
    RouterLink,
  ],
  providers: const [
    const Provider(APP_BASE_HREF, useValue: '/'),
    routerProviders,
    materialProviders,
  ],
  styleUrls: const ['app_component.css'],
)
class AppComponent {
  final Element element;
  String title = 'Sub Application Example';

  String dashboardRoute = route.dashboardRoute.toUrl();
  String userRoute = route.userRoute.toUrl();
  String groupsRoute = route.groupsRoute.toUrl();

  final List<RouteDefinition> routes = [
    new RouteDefinition(
      routePath: route.dashboardRoute,
      component: dashboard.DashboardComponentNgFactory,
      useAsDefault: true,
    ),
    new RouteDefinition(
      path: route.userRoute.path + '(/.*)?',
      component: child.ChildAppComponentNgFactory,
      additionalData: 'users',
    ),
    new RouteDefinition(
      routePath: route.groupsRoute,
      component: child.ChildAppComponentNgFactory,
      additionalData: 'groups',
    ),
  ];

  AppComponent(this.element);
}
