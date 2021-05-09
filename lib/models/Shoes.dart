class Shoes {
  final String model;
  final double oldPrice;
  final double currentPrice;
  final List<String> images;
  final int modelNumber;
  final int color;

  Shoes({
    this.model,
    this.oldPrice,
    this.currentPrice,
    this.images,
    this.modelNumber,
    this.color,
  });
}

final shoes = <Shoes>[
  Shoes(
    model: "AIR MAX 90 EZ BLACK",
    currentPrice: 149,
    oldPrice: 299,
    images: [
      "assets/img/shoes1_1.png",
      "assets/img/shoes1_2.png",
      "assets/img/shoes1_3.png",
    ],
    modelNumber: 90,
    color: 0xFFF6F6F6,
  ),
  Shoes(
    model: "AIR MAX 90 EZ BLACK",
    currentPrice: 180,
    oldPrice: 445,
    images: [
      "assets/img/shoes2_1.png",
      "assets/img/shoes2_2.png",
      "assets/img/shoes2_3.png",
    ],
    modelNumber: 270,
    color: 0xFFFCF5EB,
  ),
  Shoes(
    model: "AIR MAX 90 EZ BLACK",
    currentPrice: 149,
    oldPrice: 299,
    images: [
      "assets/img/shoes3_1.png",
      "assets/img/shoes3_2.png",
      "assets/img/shoes3_3.png",
    ],
    modelNumber: 90,
    color: 0xFFFEF7ED,
  ),
  Shoes(
    model: "AIR MAX 90 EZ BLACK",
    currentPrice: 149,
    oldPrice: 299,
    images: [
      "assets/img/shoes4_1.png",
      "assets/img/shoes4_2.png",
      "assets/img/shoes4_3.png",
    ],
    modelNumber: 90,
    color: 0xFFFEF7DD,
  )
];
