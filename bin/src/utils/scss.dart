import 'dart:io';

import 'case.dart';
import '../model/icon_info.dart';
import '../model/icons_info.dart';

Future<IconsInfo> readScss() {
  const reversedKeywords = ['null', 'switch', 'sync', 'factory'];

  bool isIconStarted = false;
  List<IconInfo> icons = [];
  return File('./bin/codepoints.scss').readAsLines().then((lines) {
    for (var line in lines) {
      if (!isIconStarted) {
        // is the open parenthesis, where icons start next line
        Iterable<Match> matches = RegExp(r'mdi-icons:\s\(').allMatches(line);
        if (matches.isNotEmpty) {
          isIconStarted = true;
        }
      } else {
        // is the close parenthesis, where icons are all loaded.
        bool isEndOfIcons = line.contains(')');
        if (!isEndOfIcons) {
          RegExpMatch? match =
              RegExp(r'"([a-z0-9-]+)"\:\s+([0-9A-F]+)').firstMatch(line);
          if (match != null) {
            String? iconName = match.group(1);
            if (iconName == null) {
              throw 'missing icon name';
            }
            String iconIdentifier = toCamelCase(iconName);
            if (reversedKeywords.contains(iconIdentifier)) {
              iconIdentifier += 'Icon';
            }
            String? codePoint = match.group(2);
            if (codePoint == null) {
              throw 'missing code point';
            }
            codePoint = codePoint.toLowerCase();
            icons.add(
              IconInfo(
                name: iconName,
                identifier: iconIdentifier,
                codePoint: codePoint,
                type: '',
              ),
            );
          }
        }
      }
    }
    return IconsInfo(icons: icons);
  });
}
