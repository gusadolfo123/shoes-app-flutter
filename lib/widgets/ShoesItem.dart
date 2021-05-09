import 'package:flutter/material.dart';
import 'package:shoes_app/models/Shoes.dart';

class ShoesItem extends StatelessWidget {
  final Shoes item;
  const ShoesItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const itemHeight = 280.0;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: SizedBox(
        height: itemHeight,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(this.item.color),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20.0,
              left: 100.0,
              height: itemHeight * 0.7,
              child: Image.asset(
                this.item.images.first,
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
      ),
    );
  }
}
