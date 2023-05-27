import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final String child;
  final VoidCallback ontap;
  var buttoncolor = Colors.deepPurple[500];
  button({super.key, required this.child, required this.ontap});

  @override
  Widget build(BuildContext context) {
    if (child == 'C') {
      buttoncolor = Colors.green;
    } else if (child == 'Del') {
      buttoncolor = Colors.red;
    } else if (child == '=') {
      buttoncolor = Colors.deepPurple;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
              color: buttoncolor, borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              child,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
