import 'package:sich_dart/controllers/sich_controller.dart';
import 'package:sich_dart/controllers/sloboda_controller.dart';
import 'package:sich_dart/models/Sich.dart';
import 'package:sich_dart/sich_dart.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class SichDartChannel extends ApplicationChannel {
  Sich sich;

  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    sich = Sich();
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
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
      return Response.ok({"key": "value123"});
    });

    router.route("/sich").link(() => SichController(sich: sich));

    router
        .route("/sich/slobodas/[:name]")
        .link(() => SlobodaController(sich: sich));
    router
        .route('/sich/slobodas/:name/registerTask/:taskName')
        .link(() => SlobodaController(sich: sich));
    router
        .route('/sich/slobodas/:name/doTask/:taskName/:amount')
        .link(() => SlobodaController(sich: sich));
    router
        .route('/sich/slobodas/:name/:action/:amount')
        .link(() => SlobodaController(sich: sich));

    return router;
  }
}
