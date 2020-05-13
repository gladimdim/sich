import 'package:sich_dart/models/Sich.dart';
import 'package:sich_dart/sich_dart.dart';

class SichController extends Controller {
  SichController({this.sich});
  final Sich sich;
  @override
  Future<RequestOrResponse> handle(Request request) async {
    return Response.ok(sich.toJson());
  }
}
