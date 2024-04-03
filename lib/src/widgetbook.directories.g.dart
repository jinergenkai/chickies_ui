// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chickies_ui/src/Components/Button/button.dart' as _i2;
import 'package:chickies_ui/src/Components/chickies_top_bar.dart' as _i3;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'Components',
    children: [
      _i1.WidgetbookFolder(
        name: 'Button',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'ChickiesButton',
            useCase: _i1.WidgetbookUseCase(
              name: 'Button',
              builder: _i2.chickiesButtonUseCase,
            ),
          )
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'ChickiesTopBar',
        useCase: _i1.WidgetbookUseCase(
          name: 'Button',
          builder: _i3.chickiesTopBarUseCase,
        ),
      ),
    ],
  )
];
