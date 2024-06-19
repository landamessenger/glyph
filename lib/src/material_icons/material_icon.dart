import 'package:flutter/widgets.dart';

class MaterialIcon extends IconData {
  const MaterialIcon(super.codePoint);

  @override
  String? get fontFamily => 'Material Icons';

  @override
  List<String>? get fontFamilyFallback => null;

  @override
  String? get fontPackage => 'glyph';

  @override
  bool get matchTextDirection => true;
}
