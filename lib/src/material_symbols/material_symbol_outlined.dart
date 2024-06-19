import 'package:flutter/widgets.dart';

class MaterialSymbolOutlined extends IconData {
  const MaterialSymbolOutlined(super.codePoint);

  @override
  String? get fontFamily => 'Material Symbols Outlined';

  @override
  List<String>? get fontFamilyFallback => null;

  @override
  String? get fontPackage => 'glyph';

  @override
  bool get matchTextDirection => true;
}
