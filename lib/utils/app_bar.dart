import 'package:flutter/material.dart';

class GlobalAppBar extends StatelessWidget {
  const GlobalAppBar({Key? key, required this.callback, required this.title})
      : super(key: key);
  final String title;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      leadingWidth: 200,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            GestureDetector(
                onTap: callback, child: const Icon(Icons.arrow_back_ios)),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
