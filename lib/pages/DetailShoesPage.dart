import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shoes_app/models/Shoes.dart';
import 'package:shoes_app/pages/ShoppingCard.dart';

class DetailShoesPage extends StatelessWidget {
  final Shoes item;
  final ValueNotifier<bool> notifierBarVisible = ValueNotifier(false);
  DetailShoesPage({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifierBarVisible.value = true;
    });

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          "assets/img/nike_logo.png",
          height: 60,
        ),
        centerTitle: true,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.6,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Hero(
                          tag: 'background_${this.item.model}',
                          child: Container(
                            color: Color(this.item.color),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 70,
                        right: 70,
                        child: Hero(
                          tag: 'shoes_${this.item.model}',
                          child: Material(
                            color: Colors.transparent,
                            child: FittedBox(
                              child: Text(
                                this.item.modelNumber.toString(),
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.05)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      PageView.builder(
                        itemCount: this.item.images.length,
                        itemBuilder: (context, index) {
                          return Hero(
                            tag: 'image_${this.item.model}',
                            child: Container(
                              child: Image.asset(
                                this.item.images[index],
                                height: 200,
                                width: 200,
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: notifierBarVisible,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    heroTag: "value1",
                    onPressed: () async {
                      notifierBarVisible.value = false;
                      await Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) {
                            return FadeTransition(
                              opacity: animation1,
                              child: ShoppingCard(),
                            );
                          },
                        ),
                      );
                      notifierBarVisible.value = true;
                    },
                    child: Icon(Icons.favorite_border_outlined),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.grey,
                    elevation: 0.5,
                  ),
                  FloatingActionButton(
                    heroTag: "value2",
                    onPressed: () async {
                      notifierBarVisible.value = false;
                      await Navigator.of(context).push(
                        PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (context, animation1, animation2) {
                            return FadeTransition(
                              opacity: animation1,
                              child: ShoppingCard(
                                item: item,
                              ),
                            );
                          },
                        ),
                      );
                      notifierBarVisible.value = true;
                    },
                    child: Icon(Icons.shopping_bag_outlined),
                    backgroundColor: Colors.black,
                    elevation: 0.5,
                  )
                ],
              ),
            ),
            builder: (context, value, child) {
              return AnimatedPositioned(
                left: 0,
                right: 0,
                bottom: value ? 0.0 : -kToolbarHeight - 100,
                duration: const Duration(microseconds: 200),
                child: child,
              );
            },
          ),
        ],
      ),
    );
  }
}
