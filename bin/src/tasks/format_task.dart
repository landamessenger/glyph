import 'dart:io';

import 'base_task.dart';

class FormatTask extends BaseTask {
  @override
  String get title => 'Format';

  @override
  Future<void> run() async {
    super.run();
    var result = await Process.run(
      'dart',
      ['format', 'lib/'],
      workingDirectory: Directory.current.path,
    );
    stdout.write(result.stdout);
    stderr.write(result.stderr);
  }
}
