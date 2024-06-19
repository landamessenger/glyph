import 'dart:io';

import '../utils/code.dart';
import '../utils/downloader.dart';
import '../utils/printer.dart';
import '../utils/scss.dart';
import 'base_task.dart';

const mdiRepo =
    'https://raw.githubusercontent.com/Templarian/MaterialDesign-Webfont';
const fontFile = '$mdiRepo/master/fonts/materialdesignicons-webfont.ttf';
const icons = '$mdiRepo/master/scss/_variables.scss';

class MaterialDesignTask extends BaseTask {

  @override
  String get title => 'Material Design Icons';

  @override
  Future<void> run() async {
    super.run();
    printer('Downloading latest TTF file');
    await download(fontFile, './bin/materialdesignicons-webfont.ttf');

    printer('Downloading latest SCSS');
    await download(icons, './bin/codepoints.scss');

    printer('Parsing SCSS');
    var info = await readScss();

    printer('Generating code');
    await generateCode(
      baseTemplate: './bin/src/template/material_design_icons.template',
      iconTemplate: './bin/src/template/material_design_icon.template',
      dest: './lib/src/material_design_icons/material_design_icons.dart',
      info: info,
    );

    printer('Moving TTF');
    await File('./bin/materialdesignicons-webfont.ttf')
        .rename('./lib/fonts/materialdesignicons-webfont.ttf');

    printer('Deleting SCSS');
    await File('./bin/codepoints.scss').delete();
  }
}
