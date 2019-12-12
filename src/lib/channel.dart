import 'package:src/config/application_config.dart';
import 'package:src/controllers/login_controller.dart';

import 'src.dart';

import 'utility/html_template.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class SrcChannel extends ApplicationChannel {
  final HTMLRenderer htmlRenderer = HTMLRenderer();
  ApplicationConfiguration conf;

  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    conf = ApplicationConfiguration(options.configurationFilePath);
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router.route("/example").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });

    router
        .route("/login")
        .link(() => LoginController(htmlRenderer: htmlRenderer));

    final policy = conf.server.caching
        ? CachePolicy(expirationFromNow: Duration(hours: 12))
        : null;
    router.route("/*").link(
        () => FileController("public/")..addCachePolicy(policy, (_) => true));

    return router;
  }
}
