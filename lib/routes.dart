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

final RoutePath userListRoute = new RoutePath(
  path: 'list',
);

final RoutePath userCreateRoute = new RoutePath(
  path: 'create',
);

final RoutePath userListRouteExternal = new RoutePath(
  path: userListRoute.path,
  parent: userRoute,
);

final RoutePath userCreateRouteExternal = new RoutePath(
  path: userCreateRoute.path,
  parent: userRoute,
);
