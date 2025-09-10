import 'package:flutter/material.dart';

class ScreenBreakpoints {
  static const double mobileMaxWidth = 600;
  static const double tabletMaxWidth = 1024;
}

class Responsive {
  static bool isMobile(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return w < ScreenBreakpoints.mobileMaxWidth;
  }

  static bool isTablet(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return w >= ScreenBreakpoints.mobileMaxWidth && w < ScreenBreakpoints.tabletMaxWidth;
  }

  static bool isDesktop(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return w >= ScreenBreakpoints.tabletMaxWidth;
  }

  static T value<T>({
    required BuildContext context,
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(context)) {
      return desktop ?? tablet ?? mobile;
    }
    if (isTablet(context)) {
      return tablet ?? mobile;
    }
    return mobile;
  }
}

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key, required this.mobile, this.tablet, this.desktop});

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return desktop ?? tablet ?? mobile;
    }
    if (Responsive.isTablet(context)) {
      return tablet ?? mobile;
    }
    return mobile;
  }
}


