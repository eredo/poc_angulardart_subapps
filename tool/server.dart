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

  var handler = proxyHandler('http://localhost:$sourcePort/');
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

  shelf_io.serve((Request request) {
    var uri;
    var npath;

    if (hasExtension(request.requestedUri.path, extensions)) {
      npath = request.requestedUri.path;
    } else {
      npath = '/index.html';
    }

    uri = new Uri(
        scheme: request.requestedUri.scheme,
        userInfo: request.requestedUri.userInfo,
        host: request.requestedUri.host,
        port: request.requestedUri.port,
        path: npath,
        query: request.requestedUri.query,
        fragment: request.requestedUri.fragment);

    var req = new Request(request.method, uri,
        protocolVersion: request.protocolVersion,
        headers: request.headers,
        handlerPath: request.handlerPath,
        body: getBody(request),
        encoding: request.encoding,
        context: request.context);

    return handler(req);
  }, '0.0.0.0', port).then((server) {
    print('Server running at: ${server.address.host}:${server.port}');
  });
}