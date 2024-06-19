import 'base_task.dart';

class CupertinoTask extends BaseTask {
  final _remoteTtfFile =
      'https://github.com/flutter/packages/raw/main/third_party/packages/cupertino_icons/assets/CupertinoIcons.ttf';
  final _remoteDartFile =
      'https://raw.githubusercontent.com/flutter/flutter/master/packages/flutter/lib/src/cupertino/icons.dart';

  @override
  String get title => 'Cupertino';

  @override
  Future<void> run() async {
    super.run();
    await dartWrapper(
      package: 'cupertino_icons',
      fontFile: 'cupertinoicons-webfont.ttf',
      remoteTtfFile: _remoteTtfFile,
      remoteDartFile: _remoteDartFile,
    );
  }
}
