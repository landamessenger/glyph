import 'package:flutter/widgets.dart';

class CupertinoIcon extends IconData {
  const CupertinoIcon(super.codePoint);

  @override
  String? get fontFamily => 'Cupertino Icons';

  @override
  List<String>? get fontFamilyFallback => null;

  @override
  String? get fontPackage => 'icons';

  @override
  bool get matchTextDirection => true;
}
