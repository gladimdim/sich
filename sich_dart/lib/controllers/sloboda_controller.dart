import 'package:sich_dart/models/Sich.dart';
import 'package:sich_dart/models/sloboda.dart';
import 'package:sich_dart/models/tasks/tasks.dart';
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

  @Operation.put('name', 'taskName')
  Future<Response> slobodaRegisterTask(
    @Bind.path('name') String name,
    @Bind.path('taskName') String taskName,
  ) async {
    final Sloboda sloboda = sich.findSlobodaByName(name);
    final Task task = sich.findTaskByName(taskName);
    if (sloboda == null || task == null) {
      return Response.notFound();
    }

    sloboda.addTask(task);

    return Response.ok(sloboda);
  }

  @Operation.post('name', 'taskName', 'amount')
  Future<Response> doTaskForSloboda(
    @Bind.path('name') String name,
    @Bind.path('taskName') String taskName,
    @Bind.path('amount') int amount,
  ) async {
    final Sloboda sloboda = sich.findSlobodaByName(name);
    final Task task = sich.findTaskByName(taskName);
    if (sloboda == null || task == null) {
      return Response.notFound();
    }
    final ActiveTask activeTask = sloboda.findActiveTaskByName(taskName);
    if (activeTask == null) {
      return Response.notFound();
    }

    activeTask.progress += amount;

    return Response.ok(sloboda);
  }

  @Operation.put('name', 'action', 'amount')
  Future<Response> slobodaSendsSupport(
      @Bind.path('name') String name,
      @Bind.path('action') String action,
      @Bind.path('amount') int amount) async {
    final Sloboda sloboda = sich.findSlobodaByName(name);
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
