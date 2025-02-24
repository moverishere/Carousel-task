import 'package:components/components.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/helpers/widget_wrapper.dart';

@widgetbook.UseCase(name: 'Item carousel', type: MainCarousel)
Widget buildDefaultUseCase(BuildContext context) {
  final showArrows = context.knobs.boolean(label: 'Show Arrows');
  final showPagination = context.knobs.boolean(label: 'Show Pagination');
  final pageSnapping = context.knobs.boolean(
    label: 'Page Snapping',
    initialValue: true,
  );
  final showHintAnimation = context.knobs.boolean(
    label: 'Show hint Animation',
    initialValue: true,
  );
  final numberOfDots = context.knobs.int.slider(
    label: 'Amount of dots',
    initialValue: 5,
    min: 1,
    max: 21,
    divisions: 10,
  );
  final hintAnimationRepeatCount = context.knobs.int.slider(
    label: 'Hint animation repeat count',
    initialValue: 1,
    min: 1,
    max: 10,
  );
  final hintAnimationDuration = context.knobs.int.slider(
    label: 'Animation Duration milliseconds',
    initialValue: 800,
    min: 600,
    max: 1000,
  );

  final listSize = context.knobs.int.input(
    label: 'List Size',
    initialValue: 10,
  );

  return WidgetWrapper(
    child: MainCarousel.item(
      items: [
        for (int index = 0; index < listSize; index++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Card(
              child: SizedBox(
                height: 400,
                child: Center(child: Text('${index + 1}')),
              ),
            ),
          ),
      ],
      options: MainItemCarouselOptions(
        hintAnimationRepeatCount: hintAnimationRepeatCount,
        height: 400,
        displayArrows: showArrows,
        displayPagination: showPagination,
        pageSnapping: pageSnapping,
        dotCount: numberOfDots,
        showHintAnimation: showHintAnimation,
        hintAnimationDuration: Duration(milliseconds: hintAnimationDuration),
      ),
    ),
  );
}
