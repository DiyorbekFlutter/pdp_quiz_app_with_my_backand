import 'package:flutter/material.dart';

import '../widget/common_snacbar.dart';

extension ShowSnackBarExtension on BuildContext {
  CommonSnackBar showSnackBar(String contentText) => CommonSnackBar(
    context: this,
    contentText: contentText
  );
}
