class ProductModel {
  final String image;
  final String title;
  final String description;
  final double price;
  int quantity = 1;
  static List<ProductModel> productslist = [
    ProductModel(
      "assets/Rectangle 117.png",
      "Burger Combo",
      "Delicious burger",
      12.5,
    ),
    ProductModel('assets/pizza.png', "Pizza", "freshly baked pizza", 20),
  ];

  ProductModel(this.image, this.title, this.description, this.price);
}
