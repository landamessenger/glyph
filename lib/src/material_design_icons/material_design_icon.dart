import 'package:flutter/widgets.dart';

class MaterialDesignIcon extends IconData {
  const MaterialDesignIcon(super.codePoint);

  @override
  String? get fontFamily => 'Material Design Icons';

  @override
  List<String>? get fontFamilyFallback => null;

  @override
  String? get fontPackage => 'icons';

  @override
  bool get matchTextDirection => true;
}
