import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.hint, required this.label})
      : super(key: key);
  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: label,
            hintText: "Enter $hint"),
      ),
    );
  }
}
