import 'package:widgetbook/widgetbook.dart';
import 'package:components/components.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:widgetbook_workspace/main.directories.g.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data:  MainTheme().light,
            ),
            WidgetbookTheme(
              name: 'Dark ',
              data:  MainTheme().dark,
            ),
          ],
          initialTheme: WidgetbookTheme(
            name: 'Light',
            data: MainTheme().light,
          ),
        ),
        TextScaleAddon(
          scales: [1.0, 1.25, 1.5, 1.75, 2.0],
          initialScale: 1,
        ),
        InspectorAddon(enabled: true),
      ],
      directories: directories,
    );
  }
}
