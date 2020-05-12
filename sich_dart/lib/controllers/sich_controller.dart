import 'package:sich_dart/models/Sich.dart';
import 'package:sich_dart/sich_dart.dart';

class SichController extends Controller {
  final Sich sich = Sich.instance;
  @override
  Future<RequestOrResponse> handle(Request request) async {
    return Response.ok(sich.toJson());
  }
}
