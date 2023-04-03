import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.hint,
      this.validator,
      required this.label,
      this.textEditingController})
      : super(key: key);
  final String label;
  final String hint;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: textEditingController,
        validator: validator,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: label,
            hintText: "Enter $hint"),
      ),
    );
  }
}
