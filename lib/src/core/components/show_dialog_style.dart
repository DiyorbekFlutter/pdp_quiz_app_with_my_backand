import 'package:flutter/material.dart';

class ShowDialogStyle {
  bool barrierDismissible = true;
  Color? barrierColor;
  String? barrierLabel;
  bool useSafeArea = true;
  bool useRootNavigator = true;
  RouteSettings? routeSettings;
  Offset? anchorPoint;
  TraversalEdgeBehavior? traversalEdgeBehavior;

  ShowDialogStyle({
    this.barrierDismissible = true,
    this.barrierColor,
    this.barrierLabel,
    this.useSafeArea = true,
    this.useRootNavigator = true,
    this.routeSettings,
    this.anchorPoint,
    this.traversalEdgeBehavior,
  });
}
