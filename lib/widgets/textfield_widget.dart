import 'package:flutter/material.dart';
import 'package:heywork/utils/colors.dart';

class TextField1 extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Icon? prefixIcon;
  final TextInputType? keyboardType;
  final bool isPhoneNumberMode;
  final bool multiInput;
  final Function(bool)? onInputTypeChanged;

  const TextField1({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    required this.obscureText,
    this.keyboardType,
    required this.isPhoneNumberMode,
    this.onInputTypeChanged,
    required this.multiInput,
  });

  @override
  State<TextField1> createState() => _TextField1State();
}

class _TextField1State extends State<TextField1> {
  late bool _isPhoneNumber;

  @override
  void initState() {
    super.initState();
    // Initialize with the provided isPhoneNumberMode or default to true
    _isPhoneNumber = widget.isPhoneNumberMode;

    // Add listener to detect input changes
    if (widget.multiInput) widget.controller.addListener(_onInputChanged);
  }

  void _onInputChanged() {
    // Check if the input contains any letters
    final text = widget.controller.text;
    final updatedIsPhoneNumber = !text.contains(RegExp(r'[a-zA-Z]'));

    // Only update and call callback if the state has changed
    if (updatedIsPhoneNumber != _isPhoneNumber) {
      setState(() {
        _isPhoneNumber = updatedIsPhoneNumber;
      });

      // Call the optional callback if provided
      widget.onInputTypeChanged?.call(_isPhoneNumber);
    }
  }

  @override
  void dispose() {
    // Remove listener when widget is disposed
    widget.controller.removeListener(_onInputChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType ?? TextInputType.emailAddress,
      decoration: InputDecoration(
        constraints: const BoxConstraints(maxWidth: 300),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: hints, fontSize: 14),
        prefixIcon: !_isPhoneNumber
            ? Padding(
                padding: const EdgeInsets.all(15),
                child: widget.prefixIcon,
              )
            : Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  '+91 ',
                  style: TextStyle(color: primary, fontWeight: FontWeight.bold),
                )),
        filled: true,
        fillColor: const Color(0xffEDECF4),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
