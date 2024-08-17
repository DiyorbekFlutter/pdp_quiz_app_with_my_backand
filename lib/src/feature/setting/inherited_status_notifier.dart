import 'package:flutter/cupertino.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/setting/status_controller.dart';

class InheritedStatusNotifier extends InheritedNotifier<StatusController> {
  const InheritedStatusNotifier({
    super.key,
    required final StatusController controller,
    required super.child,
  }) : super(notifier: controller);

  static StatusController? maybeOf(BuildContext context, {bool listen = false}) {
    if(listen) {
      return context.dependOnInheritedWidgetOfExactType<InheritedStatusNotifier>()?.notifier;
    } else {
      final Widget? inhW = context.getElementForInheritedWidgetOfExactType<InheritedStatusNotifier>()?.widget;
      return inhW is InheritedStatusNotifier ? inhW.notifier : null;
    }
  }
}
