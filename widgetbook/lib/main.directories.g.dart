// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_workspace/carousel/banner_carousel.dart' as _i2;
import 'package:widgetbook_workspace/carousel/item_carousel.dart' as _i3;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'components',
    children: [
      _i1.WidgetbookFolder(
        name: 'carousel',
        children: [
          _i1.WidgetbookComponent(
            name: 'MainCarousel',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Banner carousel',
                builder: _i2.buildDefaultUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'Item carousel',
                builder: _i3.buildDefaultUseCase,
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
