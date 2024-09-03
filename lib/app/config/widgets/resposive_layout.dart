import 'package:flutter/material.dart';

const int largeLayoutSize = 1366;
const int mediumLayoutSize = 768;
const int smallLayoutSize = 360;
const int customLayoutSize = 1100;

class ResponsiveLayout extends StatelessWidget {
  final Widget? largeLayout;
  final Widget? mediumLayout;
  final Widget? smallLayout;
  final Widget? customLayout;
  final bool? isDesktop;

  const ResponsiveLayout({
    super.key,
    this.largeLayout,
    this.mediumLayout,
    this.smallLayout,
    this.customLayout,
    this.isDesktop,
  });

  static bool isSmallLayout(BuildContext context) {
    return MediaQuery.sizeOf(context).width < mediumLayoutSize;
  }

  static bool isMediumLayout(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= mediumLayoutSize &&
        MediaQuery.sizeOf(context).width < largeLayoutSize;
  }

  static bool isLargeLayout(BuildContext context) {
    return MediaQuery.sizeOf(context).width > largeLayoutSize;
  }

  static bool isCustomSize(BuildContext context) {
    return MediaQuery.sizeOf(context).width <= customLayoutSize &&
        MediaQuery.sizeOf(context).width >= mediumLayoutSize;
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.orientationOf(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (orientation == Orientation.landscape) {
          return largeLayout ?? smallLayout ?? const SizedBox.shrink();
        }
        if (isDesktop != null && isDesktop == false) {
          return smallLayout!;
        }
        if (constraints.maxWidth >= largeLayoutSize || (isDesktop ?? false)) {
          return largeLayout ?? smallLayout!;
        } else if (constraints.maxWidth < largeLayoutSize &&
                constraints.maxWidth >= mediumLayoutSize ||
            (isDesktop ?? false)) {
          return mediumLayout ?? largeLayout!;
        } else {
          return smallLayout ?? largeLayout!;
        }
      },
    );
  }
}
