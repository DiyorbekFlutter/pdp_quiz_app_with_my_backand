import 'package:flutter/material.dart';

import '../../../../core/components/build_show_dialog.dart';

class SubmitScoreErrorDialog extends BuildShowDialog {
  final Future<void> Function() submitScore;

  SubmitScoreErrorDialog({
    required super.context,
    required this.submitScore
  });

  @override
  void style() {
    super.style();
    barrierDismissible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: const EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.amber.withOpacity(0.4)
                    ),
                    child: const Text(
                      "Yeg'ilgan ballar serverga yuborilmadi iltimos internetni tekshirib ko'ring va qayta urinish tugmasini bosing !!!",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 4,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Bekor qilish"),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: (){
                      submitScore();
                      Navigator.pop(context);
                    },
                    child: const Text("Qayta  urinish"),
                  )
                ],
              )
            ],
          ),
        );
      }
    );
  }
}
