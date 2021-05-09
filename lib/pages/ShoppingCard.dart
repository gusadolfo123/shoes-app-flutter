import 'package:flutter/material.dart';
import 'package:shoes_app/models/Shoes.dart';

class ShoppingCard extends StatelessWidget {
  final Shoes item;

  ShoppingCard({this.item});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                color: Colors.black87,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Stack(
              children: [
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 1.0, end: 0.0),
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(
                        0.0,
                        value * size.height * 0.6,
                      ),
                      child: child,
                    );
                  },
                  child: Container(
                    height: size.height * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              this.item.images.first,
                              height: 140,
                            ),
                            Column(
                              children: [
                                Text(item.model),
                                Text(item.currentPrice.toString()),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Container(
              child: Text("Prueba"),
            ),
          ),
        ],
      ),
    );
  }
}
