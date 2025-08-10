import 'package:task_tracker/vaden_application.dart';
import 'package:vaden/vaden.dart';

Future<void> main(List<String> args) async {
  final vaden = VadenApp();
  await vaden.setup();
  final server = await vaden.run(args);
  print('Server listening on port ${server.port}');
}

