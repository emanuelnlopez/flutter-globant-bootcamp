import 'package:adaptive_ui/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

abstract class BaseAdapter {
  final _logger = Logger('BaseAdapter');

  Widget buildCompact(BuildContext context);

  Widget buildMedium(BuildContext context) {
    return buildCompact(context);
  }

  Widget buildExpanded(BuildContext context) {
    return buildMedium(context);
  }

  Widget buildLarge(BuildContext context) {
    return buildExpanded(context);
  }

  Widget buildExtraLarge(BuildContext context) {
    return buildLarge(context);
  }

  Widget build(BuildContext context) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: LayoutBuilder(
          builder: (context, constraints) {
            Widget result;
            final screenSize = ScreenSize.fromScreenWidth(constraints.maxWidth);
            _logger.finest('building $runtimeType - ${screenSize.name}');
            switch (screenSize) {
              case ScreenSize.compact:
                result = buildCompact(context);
                break;
              case ScreenSize.medium:
                result = buildMedium(context);
                break;
              case ScreenSize.expanded:
                result = buildExpanded(context);
                break;
              case ScreenSize.large:
                result = buildLarge(context);
                break;
              case ScreenSize.extraLarge:
                result = buildExtraLarge(context);
                break;
            }
            return result;
          },
        ),
      );
}
