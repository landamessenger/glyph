import 'dart:io';

import 'case.dart';
import '../model/icons_info.dart';

Future generateCode({
  required String baseTemplate,
  required String iconTemplate,
  required String dest,
  required IconsInfo info,
}) async {
  String templateFile = await File(baseTemplate).readAsString();

  String templateIcon = await File(iconTemplate).readAsString();

  String content = '';

  String type = '';

  for (var icon in info.icons) {
    type = icon.type;
    content += templateIcon
        .replaceAll('_ICON_NAME_', icon.identifier)
        .replaceAll('_ICON_CODE_', icon.codePoint)
        .replaceAll('_TYPE_CAPITALIZE_', capitalize(type))
        .replaceAll('_TYPE_', type);
  }

  await File(dest).writeAsString(
    templateFile
        .replaceAll('_ICONS_', content)
        .replaceAll('_TYPE_CAPITALIZE_', capitalize(type))
        .replaceAll('_TYPE_', type),
  );
}
