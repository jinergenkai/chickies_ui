<a href="https://www.linkedin.com/in/jinergenkai"><img src="https://github.com/jinergenkai/chickies_ui/blob/main/assets/images/chickies_logo.png" alt="chickies_logo" style="width:100px;"/></a>
# Chickies UI
  a Beatiful widget gallery template for flutter.
  I create my own widget to reuse for many project on my journey. let contact and contribute it if you interest.

# Gallery
  - Use WidgetBook to create gallery view (make it readable and easier to maintenance).

# Installation - add packages to your project
  - clone this packages 
  ```
  git submodule add https://github.com/jinergenkai/chickies_ui.git packages/chickies_ui
  ```
  - in pubspec.yaml add to dependency:
  ```
    chickies_ui:
      path: packages/chickies_ui
  ```
  - And then flutter pub get.

# Instruction - Add new widget to WidgetBook
  - Create new Widget
  - Add library:
  ```
  import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
  ```
  - Add usecase above widget you created (widget to show in widgetbook), example:
  ```
  @widgetbook.UseCase(
    name: 'Button',
    type: ChickiesTopBar,
  )
  ChickiesTopBar chickiesTopBarUseCase(BuildContext context) {
    return ChickiesTopBar(
      tabs: [
        Container(color: ChickiesColor.red),
        Container(color: ChickiesColor.green),
        Container(color: ChickiesColor.blue),
      ],
      titles: ['Tab 1', 'Tab 2', 'Tab 3'],
      title: 'Title',
    );
  }
  ```
  - Run terminal:
  ```
  dart run build_runner build --delete-conflicting-outputs
  ```
  ```
  flutter run -d chrome -t lib/src/widgetbook.dart
  ```
