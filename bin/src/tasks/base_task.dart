import 'dart:io';

import '../utils/code.dart';
import '../utils/dart.dart';
import '../utils/downloader.dart';
import '../utils/printer.dart';

abstract class BaseTask {
  String get title => '';

  Future run() async {
    printer('\n\n 🟢 $title \n\n');
  }

  dartWrapper({
    required String package,
    required String fontFile,
    required String remoteTtfFile,
    required String remoteDartFile,
  }) async {
    printer('Downloading latest TTF for $package (./bin/$fontFile)');
    await download(remoteTtfFile, './bin/$fontFile');

    printer('Downloading latest Dart map for $package (./bin/$package.dart)');
    await download(remoteDartFile, './bin/$package.dart');

    printer('Reading Dart file (./bin/$package.dart)');
    final info = await readDart('./bin/$package.dart');

    final codeFile = './lib/src/$package/$package.dart';
    printer('Generating code on $codeFile');
    await generateCode(
      baseTemplate: './bin/src/template/$package.template',
      iconTemplate:
          './bin/src/template/${package.substring(0, package.length - 1)}.template',
      dest: codeFile,
      info: info,
    );

    printer('Moving TTF');
    await File('./bin/$fontFile').rename('./lib/fonts/$fontFile');

    printer('Deleting Dart');
    await File('./bin/$package.dart').delete();
  }
}
