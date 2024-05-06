import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      crossAxisCount: 3,
      children: List.generate(12, (index) {
        return Container(
          margin: EdgeInsets.all(2),
          color: Colors.grey,
        );
      }),
    );
  }
}
