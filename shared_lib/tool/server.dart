import 'dart:async';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_proxy/shelf_proxy.dart';
import 'package:shelf/src/message.dart' show getBody;

bool hasExtension(String path, List<String> extensions) {
  return extensions.any((e) => path.endsWith('.$e'));
}

void main(List<String> args) {
  var port = 8082;
  var sourcePort = 8080;

  final applications = {
    'users': 8090,
    'groups': 8070,
  };

  final applicationHandler = {};

  var handler = proxyHandler('http://localhost:$sourcePort/');

  applicationHandler.addAll(applications.map((name, port) => new MapEntry(name, proxyHandler('http://localhost:$port/'))));

  var extensions = [
    'dart',
    'png',
    'gif',
    'jpg',
    'js',
    'css',
    'html',
    'eot',
    'svg',
    'ttf',
    'woff',
    'map',
    'manifest',
  ];

  shelf_io.serve((Request request) async {
    Uri uri;
    String npath;
    FutureOr<Response> Function(Request) thandler = handler;

    print('Receive: ${request.requestedUri}');
    if (hasExtension(request.requestedUri.path, extensions)) {
      npath = request.requestedUri.path;
    } else {
      npath = '/index.html';
    }

    var port = 8080;
    String appRedirect;

    final app = applicationHandler.keys.firstWhere((k) => request.requestedUri.path.startsWith('/$k'), orElse: () => null);
    if (app != null) {
      print('redirect to $app server');
      port = applications[app];
      npath = npath.replaceFirst('/$app', '');
      thandler = applicationHandler[app];
      appRedirect = app;
    }

    uri = new Uri(
        scheme: request.requestedUri.scheme,
        userInfo: request.requestedUri.userInfo,
        host: request.requestedUri.host,
        port: port,
        path: npath,
        query: request.requestedUri.query);

    print('Redirect: $uri');
    var req = new Request(request.method, uri,
        protocolVersion: request.protocolVersion,
        headers: request.headers,
        handlerPath: request.handlerPath,
        body: getBody(request),
        encoding: request.encoding,
        context: request.context);

    Response response = await thandler(req);
    if (appRedirect != null && uri.path.endsWith('.js')) {
      final content = await response.readAsString();
      response = response.change(
          body: content
              .replaceAll('"web/main"', '"$appRedirect/web/main"')
              .replaceAll('"main.ddc"', '"$appRedirect/main.ddc"')
              .replaceAll('packages/shared_lib/child_application', '$appRedirect/packages/shared_lib/child_application')
              .replaceAll('packages/${appRedirect}_app', '$appRedirect/packages/${appRedirect}_app'));
    }

    return response;
  }, '0.0.0.0', port).then((server) {
    print('Server running at: ${server.address.host}:${server.port}');
  });
}
