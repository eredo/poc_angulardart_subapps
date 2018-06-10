import 'package:angular_router/angular_router.dart';

final RoutePath userRoute = new RoutePath(
  path: 'users',
);

final RoutePath dashboardRoute = new RoutePath(
  path: 'dashboard',
);


final RoutePath stackTraceRoute = new RoutePath(
  path: 'stack-trace',
);

final RoutePath groupsRoute = new RoutePath(
  path: 'groups',
);

final RoutePath userListRouteExternal = new RoutePath(
  path: 'list',
  parent: userRoute,
);

final RoutePath userCreateRouteExternal = new RoutePath(
  path: 'group',
  parent: userRoute,
);
