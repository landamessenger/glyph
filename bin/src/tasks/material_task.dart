import 'dart:io';

import '../utils/code.dart';
import '../utils/downloader.dart';
import '../utils/printer.dart';
import '../utils/code_points.dart';
import 'base_task.dart';

const mdiRepo =
    'https://github.com/google/material-design-icons/raw';
const fontFile = '$mdiRepo/master/font/MaterialIcons-Regular.ttf';
const icons = '$mdiRepo/master/font/MaterialIcons-Regular.codepoints';

class MaterialTask extends BaseTask {

  @override
  String get title => 'Material (regular)';

  @override
  Future<void> run() async {
    super.run();

    printer('Downloading latest TTF file');
    await download(fontFile, './bin/materialicons-webfont.ttf');

    printer('Downloading latest codepoints');
    await download(icons, './bin/codepoints');

    printer('Parsing codepoints');
    var info = await readCodepoints('');

    printer('Generating code');
    await generateCode(
      baseTemplate: './bin/src/template/material_icons.template',
      iconTemplate: './bin/src/template/material_icon.template',
      dest: './lib/src/material_icons/material_icons.dart',
      info: info,
    );

    printer('Moving TTF');
    await File('./bin/materialicons-webfont.ttf')
        .rename('./lib/fonts/materialicons-webfont.ttf');

    printer('Deleting codepoints');
    await File('./bin/codepoints').delete();
  }
}
