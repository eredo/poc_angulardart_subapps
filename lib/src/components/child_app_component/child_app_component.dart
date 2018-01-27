import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'child-app',
  template: '',
)
class ChildAppComponent implements OnActivate, CanReuse {
  final Element element;

  Map<String, Element> _apps = {};
  Element _activeApp;

  ChildAppComponent(this.element);

  @override
  void onActivate(RouterState previous, RouterState current) {
    var appName = current.routePath.additionalData as String;
    print('activate: $current');

    _activeApp?.style?.display = 'none';
    if (_apps.containsKey(appName)) {
      _activeApp = _apps[appName];
    } else {
      _activeApp = _apps[appName] = _createApp(appName);
    }

    _activeApp.style.display = 'block';
  }

  @override
  Future<bool> canReuse(RouterState current, RouterState next) async => true;

  Element _createApp(String appName) {
    var appContainer = new DivElement();
    element.append(appContainer);
    var app = element.ownerDocument.createElement('${appName}-app');
    appContainer.append(app);

    var head = element.ownerDocument.querySelector('head');
    var req = new ScriptElement();

    const available =
        const bool.fromEnvironment('requirejs', defaultValue: true);
    if (available) {
      req.innerHtml =
          'require(["${appName}/main.dart.bootstrap"]);console.log("done");';
    } else {
      req.src = '/${appName}/main.dart.js';
    }

    head.append(req);
    return appContainer;
  }
}
