import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class WidgetWrapper extends StatelessWidget {
  final Widget child;
  final bool containsSheet;
  final bool showSkeleton;
  final bool isResizable;
  final bool isFullHeight;

  const WidgetWrapper({
    super.key,
    required this.child,
    this.containsSheet = false,
    this.showSkeleton = false,
    this.isResizable = false,
    this.isFullHeight = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _SheetWrapper(
      containsSheet: containsSheet,
      child: Directionality(
        textDirection:
            context.knobs.boolean(label: "[WB] RTL text direction")
                ? TextDirection.rtl
                : TextDirection.ltr,
        child: Scaffold(
          backgroundColor:
              context.knobs.colorOrNull(
                label: "[WB] Background color",
                initialValue: theme.colorScheme.secondaryContainer.withValues(
                  alpha: 0.5,
                ),
              ) ??
              theme.colorScheme.surface,
          body: _BannerWrapper(
            message:
                containsSheet
                    ? """For certain widgets with sheets like this one, non-default locale settings don't work correctly in Widgetbook.
To show error or helper messages, enable those fields, then paste text into them."""
                    : null,
            child: _CenterWrapper(
              isCentered: !isFullHeight,
              child:
                  isResizable
                      ? SizedBox(
                        width: context.knobs.doubleOrNull.slider(
                          label: '[WB] Width',
                          initialValue: 310,
                          min: 270,
                          max: 720,
                        ),
                        child: child,
                      )
                      : child,
            ),
          ),
        ),
      ),
    );
  }
}

class _CenterWrapper extends StatelessWidget {
  final bool isCentered;
  final Widget child;

  const _CenterWrapper({required this.isCentered, required this.child});

  @override
  Widget build(BuildContext context) {
    return isCentered
        ? Align(alignment: Alignment.center, child: child)
        : child;
  }
}

class _SheetWrapper extends StatelessWidget {
  final bool containsSheet;
  final Widget child;

  const _SheetWrapper({required this.containsSheet, required this.child});

  @override
  Widget build(BuildContext context) {
    return containsSheet
        ? Navigator(
          onGenerateRoute:
              (_) => PageRouteBuilder(pageBuilder: (context, _, __) => child),
        )
        : child;
  }
}

class _BannerWrapper extends StatelessWidget {
  final String? message;
  final Widget child;

  const _BannerWrapper({required this.message, required this.child});

  @override
  Widget build(BuildContext context) {
    return message != null
        ? Column(
          children: [
            MaterialBanner(
              content: Text(message!),
              actions: const <Widget>[SizedBox.shrink()],
            ),
            Expanded(child: child),
          ],
        )
        : child;
  }
}
