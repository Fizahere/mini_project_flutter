import 'package:flutter/material.dart';

class RowExample extends StatelessWidget {
  const RowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 600,
        color: Colors.black,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 80,
              color: Colors.green,
            ),
            Container(
              width: 40,
              height: 40,
              color: Colors.red,
            ),
            Container(
              width: 40,
              height: 80,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
