import 'package:flutter/material.dart';

class Breakpoints {
  Breakpoints._();

  static const double mobile = 600;

  static const double tablet = 900;

  static const double desktop = 1200;
}

enum DeviceType { mobile, tablet, desktop }

class Responsive {
  Responsive._();

  static DeviceType getDeviceType(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    if (width < Breakpoints.mobile) {
      return DeviceType.mobile;
    } else if (width < Breakpoints.tablet) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }

  static bool isMobile(BuildContext context) =>
      getDeviceType(context) == DeviceType.mobile;

  static bool isTablet(BuildContext context) =>
      getDeviceType(context) == DeviceType.tablet;

  static bool isDesktop(BuildContext context) =>
      getDeviceType(context) == DeviceType.desktop;

  static bool isTabletOrLarger(BuildContext context) {
    final DeviceType deviceType = getDeviceType(context);
    return deviceType == DeviceType.tablet || deviceType == DeviceType.desktop;
  }

  static double getHorizontalPadding(BuildContext context) => switch (getDeviceType(context)) {
      DeviceType.mobile => 16,
      DeviceType.tablet => 32,
      DeviceType.desktop => 48,
    };

  static double getSpacingMultiplier(BuildContext context) => switch (getDeviceType(context)) {
      DeviceType.mobile => 1,
      DeviceType.tablet => 1.25,
      DeviceType.desktop => 1.5,
    };

  static double? getMaxContentWidth(BuildContext context) => switch (getDeviceType(context)) {
      DeviceType.mobile => null,
      DeviceType.tablet => 600,
      DeviceType.desktop => 800,
    };
}

extension ResponsiveEdgeInsets on BuildContext {
  EdgeInsets get responsiveHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: Responsive.getHorizontalPadding(this));

  EdgeInsets responsivePadding({double horizontal = 16, double vertical = 0}) {
    final double multiplier = Responsive.getSpacingMultiplier(this);
    return EdgeInsets.symmetric(
      horizontal: horizontal * multiplier,
      vertical: vertical * multiplier,
    );
  }

  double responsiveSpacing(double baseSpacing) =>
      baseSpacing * Responsive.getSpacingMultiplier(this);
}

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    required this.mobile,
    this.tablet,
    this.desktop,
    super.key,
  });

  final Widget mobile;

  final Widget? tablet;

  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    switch (Responsive.getDeviceType(context)) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet ?? mobile;
      case DeviceType.desktop:
        return desktop ?? tablet ?? mobile;
    }
  }
}

class ResponsiveConstrainedBox extends StatelessWidget {
  const ResponsiveConstrainedBox({
    required this.child,
    this.maxWidth,
    this.alignment = Alignment.center,
    super.key,
  });

  final Widget child;

  final double? maxWidth;

  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final double? effectiveMaxWidth =
        maxWidth ?? Responsive.getMaxContentWidth(context);

    if (effectiveMaxWidth == null) {
      return child;
    }

    return Align(
      alignment: alignment,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: effectiveMaxWidth),
        child: child,
      ),
    );
  }
}

class ResponsivePadding extends StatelessWidget {
  const ResponsivePadding({
    required this.child,
    this.horizontal = 16,
    this.vertical = 0,
    super.key,
  });

  final Widget child;

  final double horizontal;

  final double vertical;

  @override
  Widget build(BuildContext context) => Padding(
    padding: context.responsivePadding(
      horizontal: horizontal,
      vertical: vertical,
    ),
    child: child,
  );
}
