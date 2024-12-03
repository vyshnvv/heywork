import 'package:flutter/material.dart';
import 'package:heywork/utils/colors.dart';

class ButtonPrimary extends StatefulWidget {
  final String btnText;
  final VoidCallback onTap;
  const ButtonPrimary({
    super.key,
    required this.btnText,
    required this.onTap,
  });

  @override
  State<ButtonPrimary> createState() => _ButtonPrimary();
}

class _ButtonPrimary extends State<ButtonPrimary> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ElevatedButton(
        onPressed: () => {},
        style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            minimumSize: Size(width / 1.3, 55),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Text(
          widget.btnText,
          style: TextStyle(
              color: secondary10, fontWeight: FontWeight.bold, fontSize: 18),
        ));
  }
}
