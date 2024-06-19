import 'dart:io';

import '../utils/case.dart';
import '../utils/code.dart';
import '../utils/code_points.dart';
import '../utils/downloader.dart';
import '../utils/printer.dart';
import 'base_task.dart';

class MaterialSymbolsTask extends BaseTask {
  final mdiRepo =
      'https://raw.githubusercontent.com/google/material-design-icons/master';

  @override
  String get title => 'Material Symbols';

  @override
  Future<void> run() async {
    super.run();
    await _processFontType('outlined');
    await _processFontType('rounded');
    await _processFontType('sharp');
  }

  Future<void> _processFontType(String type) async {
    printer('\n \t 🔵 ${capitalize(type)} \n');

    String fontFile =
        '$mdiRepo/variablefont/MaterialSymbols${capitalize(type)}%5BFILL,GRAD,opsz,wght%5D.ttf';
    String icons =
        '$mdiRepo/variablefont/MaterialSymbols${capitalize(type)}%5BFILL%2CGRAD%2Copsz%2Cwght%5D.codepoints';

    printer('Downloading latest TTF file');
    await download(fontFile, './bin/materialsymbols$type-webfont.ttf');

    printer('Downloading latest codepoints');
    await download(icons, './bin/codepoints');

    printer('Parsing codepoints');
    var info = await readCodepoints(type);

    printer('Generating code');
    await generateCode(
      baseTemplate: './bin/src/template/material_symbols.template',
      iconTemplate: './bin/src/template/material_symbol.template',
      dest: './lib/src/material_symbols/material_symbols_$type.dart',
      info: info,
    );

    printer('Moving TTF');
    await File('./bin/materialsymbols$type-webfont.ttf')
        .rename('./lib/fonts/materialsymbols$type-webfont.ttf');

    printer('Deleting codepoints');
    await File('./bin/codepoints').delete();
  }
}
