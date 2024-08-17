import 'package:flutter/material.dart';

import '../components/build_snackbar.dart';

class CommonSnackBar extends BuildSnackBar {
  final String contentText;

  CommonSnackBar({
    required super.context,
    required this.contentText
  });

  @override
  SnackBar build() {
    return SnackBar(
      content: Text(contentText),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.black,
      dismissDirection: DismissDirection.horizontal,
    );
  }
}
