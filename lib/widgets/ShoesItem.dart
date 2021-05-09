import 'package:flutter/material.dart';
import 'package:shoes_app/models/Shoes.dart';

class ShoesItem extends StatelessWidget {
  final Shoes item;
  final VoidCallback onTap;
  const ShoesItem({Key key, this.item, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const itemHeight = 290.0;
    return InkWell(
      onTap: this.onTap,
      child: Padding(
        padding: EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0,
        ),
        child: SizedBox(
          height: itemHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: Hero(
                  tag: 'background_${this.item.model}',
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(this.item.color),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: 'shoes_${this.item.model}',
                  child: SizedBox(
                    height: itemHeight * 0.6,
                    child: Material(
                      color: Colors.transparent,
                      child: FittedBox(
                        child: Text(
                          this.item.modelNumber.toString(),
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.05)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20.0,
                left: 60.0,
                height: itemHeight * 0.65,
                child: Hero(
                  tag: 'image_${this.item.model}',
                  child: Image.asset(
                    this.item.images.first,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.grey,
                ),
              ),
              Positioned(
                bottom: 20.0,
                right: 20.0,
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.grey,
                ),
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 20.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Text(
                        item.model,
                        style: TextStyle(color: Colors.black.withOpacity(0.5)),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '\$ ${item.oldPrice.toString()}',
                        style: TextStyle(
                          color: Colors.red[400],
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        '\$ ${item.currentPrice.toString()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
