import 'dart:io';

import '../model/icon_info.dart';
import '../model/icons_info.dart';

Future<IconsInfo> readCodepoints(String type) {
  final icons = <String, IconInfo>{};
  return File('./bin/codepoints').readAsLines().then((lines) {
    for (var line in lines) {
      var iconIdentifier = line.split(' ').first;
      final codePoint = line.split(' ').last;

      RegExp regExp = RegExp(r'^\d');

      if (regExp.hasMatch(iconIdentifier)) {
        iconIdentifier = 'n$iconIdentifier';
      }

      var identifier = _convertToCamelCase(iconIdentifier);

      if (identifier == 'try' || identifier == 'class' || identifier == 'switch') {
        identifier = '${identifier}Icon';
      }

      icons[identifier] = IconInfo(
        name: identifier,
        identifier: identifier,
        codePoint: codePoint,
        type: type,
      );
    }
    return IconsInfo(icons: icons.values.toList());
  });
}

String _convertToCamelCase(String text) {
  if (!text.contains('_')) {
    return text;
  }

  List<String> parts = text.split('_');

  String camelCaseString = parts[0];

  for (int i = 1; i < parts.length; i++) {
    camelCaseString += parts[i][0].toUpperCase() + parts[i].substring(1);
  }

  return camelCaseString;
}
