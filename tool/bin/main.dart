import 'dart:io' as io;

import 'package:args/command_runner.dart';
import 'package:batt/src/context.dart';
import 'package:batt/src/sync.dart';
import 'package:file/local.dart';

const String version = '0.0.1';
const LocalFileSystem fs = LocalFileSystem();

CommandRunner<int> buildRunner() {
  final Context ctx = Context(
    fs: fs,
    // TODO this won't work if AOT compiled
    root: fs.file(io.Platform.script.path).parent.parent,
  );

  return CommandRunner<int>('batt', 'Flutter Build and Test Tool')
    ..addCommand(SyncCommand(ctx: ctx));
}

Future<void> main(List<String> arguments) async {
  final CommandRunner<int> runner = buildRunner();
  try {
    await runner.run(arguments);
  } on FormatException catch (e) {
    // Print usage information if an invalid argument was provided.
    print(e.message);
    print('');
    print(runner.usage);
  }
}
