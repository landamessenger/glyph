import 'dart:io';

import '../model/icon_info.dart';
import '../model/icons_info.dart';
import 'case.dart';

const containerA = 'static const IconData ';
const containerB = ' = IconData(';

Future<IconsInfo> readDart(String pathFile) {
  List<IconInfo> icons = [];
  return File(pathFile).readAsLines().then((lines) {
    for (var line in lines) {
      if (!line.contains(containerA) && !line.contains(containerB)) {
        continue;
      }

      final partA = line.split(containerA).lastOrNull;
      if (partA == null) {
        continue;
      }

      final parts = partA.split(containerB);

      final iconIdentifier = toCamelCase(parts.first);
      final codePoint = parts.lastOrNull?.split(',').first ?? '';

      icons.add(
        IconInfo(
          name: iconIdentifier,
          identifier: iconIdentifier,
          codePoint: codePoint.replaceAll('0x', ''),
          type: '',
        ),
      );
    }

    return IconsInfo(icons: icons);
  });
}
