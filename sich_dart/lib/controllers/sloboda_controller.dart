import 'package:sich_dart/models/Sich.dart';
import 'package:sich_dart/models/sloboda.dart';
import 'package:sich_dart/sich_dart.dart';

class SlobodaController extends ResourceController {
  final Sich sich = Sich.instance;

  @Operation.get()
  Future<Response> getAllSlobodas() async {
    return Response.ok(sich.slobodas);
  }

  @Operation.get('name')
  Future<Response> getSlobodaByName(@Bind.path('name') String name) async {
    final Sloboda sloboda = sich.slobodas
        .firstWhere((element) => element.name == name, orElse: () => null);
    if (sloboda == null) {
      return Response.notFound();
    } else {
      return Response.ok(sloboda.toJson());
    }
  }

  Sloboda _findSlobodaByName(String name) {
    return sich.slobodas
        .firstWhere((element) => element.name == name, orElse: () => null);
  }

  @Operation.put('name', 'action', 'amount')
  Future<Response> slobodaSendsSupport(
      @Bind.path('name') String name,
      @Bind.path('action') String action,
      @Bind.path('amount') int amount) async {
    final Sloboda sloboda = _findSlobodaByName(name);
    if (sloboda == null) {
      return Response.notFound();
    }

    if (action == 'sendMoney') {
      sloboda.money += amount;
    }
    if (action == 'sendCossacks') {
      sloboda.cossacks += amount;
    }
    return Response.ok(sloboda.toJson());
  }
}
