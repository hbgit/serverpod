import 'dart:async';
import 'dart:io';

import 'package:relic/relic.dart';

/// Creates the relic [Adapter] the API server listens on.
///
/// By default Serverpod binds the API server through `RelicApp.serve`, which
/// covers HTTP and one-way HTTPS. Some bind options of `dart:io` are not
/// reachable that way — for instance `SecureServerSocket.bind(…,
/// requireClientCertificate: true)` for mutual TLS, which `HttpServer.bindSecure`
/// does not expose. Supplying a factory lets the application bind the socket
/// itself and hand the resulting [Adapter] to Serverpod; the default behavior
/// is unchanged when no factory is given.
///
/// [address] and [port] are the ones Serverpod would have bound to, and
/// [securityContext] is `SecurityContextConfig.apiServer` (null for HTTP).
typedef ApiServerAdapterFactory =
    FutureOr<Adapter> Function(
      InternetAddress address,
      int port,
      SecurityContext? securityContext,
    );
