import 'package:flutter/widgets.dart';

class MaterialSymbolRounded extends IconData {
  const MaterialSymbolRounded(super.codePoint);

  @override
  String? get fontFamily => 'Material Symbols Rounded';

  @override
  List<String>? get fontFamilyFallback => null;

  @override
  String? get fontPackage => 'glyph';

  @override
  bool get matchTextDirection => true;
}
