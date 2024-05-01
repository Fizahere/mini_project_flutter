import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      crossAxisCount: 3,
      children: List.generate(3, (index) {
        return Container(
          margin: EdgeInsets.all(8),
          color: Colors.pink,
          child: Center(
            child: Text(
              'Item ${index + 1}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        );
      }),
    );
  }
}
