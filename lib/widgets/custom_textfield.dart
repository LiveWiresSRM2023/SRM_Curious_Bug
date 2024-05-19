import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool showLabel;
  final Widget? leadingIcon;
  final double? width;
  final Color borderColor;

  const CustomTextField(
      {super.key,
      required this.labelText,
      required this.showLabel,
      this.width,
      this.leadingIcon,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showLabel
            ? Text(labelText)
            : const SizedBox(
                height: 0,
              ),
        showLabel
            ? const SizedBox(height: 5)
            : const SizedBox(
                height: 0,
              ),
        SizedBox(
          height: 33,
          width: width,
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: leadingIcon,
              labelText: !showLabel ? (labelText) : null,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: borderColor),
              ),
              fillColor: Colors.grey[200],
              filled: true,
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
