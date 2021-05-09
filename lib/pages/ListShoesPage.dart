import 'package:flutter/material.dart';
import 'package:shoes_app/models/Shoes.dart';
import 'package:shoes_app/widgets/ShoesItem.dart';

class ListShoesPage extends StatelessWidget {
  const ListShoesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  "assets/img/nike_logo.png",
                  height: 60,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: shoes.length,
                    itemBuilder: (context, index) {
                      final shoesItem = shoes[index];
                      return ShoesItem(
                        item: shoesItem,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: kToolbarHeight,
            child: Row(
              children: [
                Expanded(
                  child: Icon(Icons.ac_unit_rounded),
                ),
                Expanded(
                  child: Icon(Icons.place_outlined),
                ),
                Expanded(
                  child: Icon(Icons.read_more),
                ),
                Expanded(
                  child: Icon(Icons.ac_unit_rounded),
                ),
                Expanded(
                  child: Icon(Icons.usb_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
