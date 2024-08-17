import 'package:flutter/material.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/blocked/blocked_page_controller.dart';
import 'package:provider/provider.dart';

class BlockedPage extends StatelessWidget {
  const BlockedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BlockedPageController controller = Provider.of<BlockedPageController>(context, listen: false);
    controller.initState(context);
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.red,
        body: Consumer<BlockedPageController>(
          builder: (context, ref, child) => const Center(
            child: Text(
              "YOU ARE BLOCKED",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900
              ),
            ),
          ),
        ),
      ),
    );
  }
}
