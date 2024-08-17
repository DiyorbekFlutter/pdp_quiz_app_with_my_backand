import 'package:flutter/material.dart';

class OptionButton extends StatefulWidget {
  final void Function() onPressed;
  final OptionStyle style;
  final String option;

  const OptionButton({
    required this.onPressed,
    required this.style,
    required this.option,
    super.key
  });

  @override
  State<OptionButton> createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  bool? correct;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.style.backgroundColor,
          side: widget.style.borderColor != null ? BorderSide(
            width: 1,
            color: widget.style.borderColor!
          ) : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          )
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              text: widget.option.substring(0, 3),
              style: TextStyle(
                color: widget.style.textColor,
                 fontWeight: FontWeight.w600,
                 fontSize: 16
              ),
              children: [
                 TextSpan(
                   text: widget.option.substring(3),
                   style: const TextStyle(fontWeight: FontWeight.w400),
                 )
              ]
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ),
    );
  }
}


class OptionStyle {
  Color? borderColor;
  Color backgroundColor;
  Color textColor;

  OptionStyle({
    required this.borderColor,
    required this.backgroundColor,
    required this.textColor
  });
}
