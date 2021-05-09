import 'package:flutter/material.dart';
import 'package:shoes_app/models/Shoes.dart';
import 'package:shoes_app/pages/DetailShoesPage.dart';
import 'package:shoes_app/widgets/ShoesItem.dart';

class ListShoesPage extends StatelessWidget {
  final ValueNotifier<bool> notifierBottomBarVisible = ValueNotifier(true);

  void _onShoesPressed(Shoes item, BuildContext context) async {
    notifierBottomBarVisible.value = false;
    await Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) {
          return FadeTransition(
            opacity: animation1,
            child: DetailShoesPage(
              item: item,
            ),
          );
        },
      ),
    );
    notifierBottomBarVisible.value = true;
  }

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
                        onTap: () {
                          _onShoesPressed(shoesItem, context);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: notifierBottomBarVisible,
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
            builder: (context, value, child) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                left: 0,
                right: 0,
                bottom: value ? 0.0 : -kToolbarHeight,
                height: kToolbarHeight,
                child: child,
              );
            },
          ),
        ],
      ),
    );
  }
}
