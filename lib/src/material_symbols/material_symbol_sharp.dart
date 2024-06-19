import 'package:flutter/widgets.dart';

class MaterialSymbolSharp extends IconData {
  const MaterialSymbolSharp(super.codePoint);

  @override
  String? get fontFamily => 'Material Symbols Sharp';

  @override
  List<String>? get fontFamilyFallback => null;

  @override
  String? get fontPackage => 'icons';

  @override
  bool get matchTextDirection => true;
}
