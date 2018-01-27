import 'dart:html' show window;
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

abstract class ChildApplication implements OnInit {
  final String baseUri;
  final Router router;
  final String name;

  ChildApplication(this.name, @Inject(APP_BASE_HREF) this.baseUri, this.router);

  @override
  void ngOnInit() {
    window.onMessage
        .where((msg) => msg.data is Map && msg.data['application'] == name)
        .map((msg) => (msg.data['path'] as String).replaceFirst(baseUri, ''))
        .listen(router.navigate);
  }
}
