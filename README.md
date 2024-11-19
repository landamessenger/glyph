# Glyph Test

[![Pub Version](https://img.shields.io/pub/v/glyph.svg)](https://pub.dev/packages/glyph)
[![Build Status](https://travis-ci.org/landamessenger/glyph.svg?branch=master)](https://travis-ci.org/landamessenger/glyph)
[![Coverage Status](https://coveralls.io/repos/github/landamessenger/glyph/badge.svg?branch=master)](https://coveralls.io/github/landamessenger/glyph?branch=master)

`glyph` provides a comprehensive collection of icons from various popular design systems, including Material, Material Design, Material Symbols, and Cupertino. This library is a versatile tool for developers and designers looking to enhance their applications with high-quality, consistent icons.

Designed with performance in mind. Unlike some icon libraries that pre-load all icons into memory, `glyph` library adopts a more efficient approach by loading icons only when they are needed, ensuring that your application remains lightweight and fast, as it avoids the unnecessary overhead of storing all icons in memory at once.

## Sets

- *Material Icons:* A collection of icons from Google's Material Design guidelines, suitable for a wide range of applications.

```dart
I.material.chatBubble
```

- *Material Design Icons:* An extended set of icons following the Material Design principles, offering additional variations and styles.

```dart
I.materialDesign.accessPoint
```

- *Material Symbols:* A flexible set of icons that can be customized in terms of weight, fill, and grade, providing a more adaptable design language.

```dart
I.materialSymbolsOutlined.appBadging
I.materialSymbolsRounded.appBadging
I.materialSymbolsSharp.appBadging
```

- *Cupertino Icons:* Icons that align with Apple's iOS design guidelines, ensuring a native look and feel for iOS applications.

```dart
I.cupertino.bookmarkSolid
```
