import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({
    Key? key,
    required this.firstField,
    required this.secondField,
  }) : super(key: key);
  final String firstField;
  final String secondField;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      child: Row(
        children: [
          Text(
            firstField,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Text(
            secondField,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
