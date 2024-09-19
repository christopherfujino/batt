import 'package:args/command_runner.dart';
import 'context.dart';

class SyncCommand extends Command<int> {
  SyncCommand({required this.ctx}) {
    print(ctx.root);
  }

  final Context ctx;

  @override
  final String name = 'sync';

  @override
  final String description = 'Create and sync sub-checkouts.';

  @override
  Future<int> run() async {
    return 0;
  }
}
