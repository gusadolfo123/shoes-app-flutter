import 'package:flutter/material.dart';

class ShoesList extends StatelessWidget {
  const ShoesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 160,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Text("asd"),
            ],
          ),
        ),
      ],
    );
  }
}
