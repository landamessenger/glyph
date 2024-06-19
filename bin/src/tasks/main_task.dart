import 'base_task.dart';
import 'cupertino_task.dart';
import 'material_design_task.dart';
import 'material_task.dart';
import 'material_symbols_task.dart';
import 'format_task.dart';

class MainTask extends BaseTask {
  final launchers = [
    CupertinoTask(),
    MaterialTask(),
    MaterialDesignTask(),
    MaterialSymbolsTask(),
    FormatTask(),
  ];

  @override
  Future<void> run() async {
    for (final launcher in launchers) {
      await launcher.run();
    }
  }
}
