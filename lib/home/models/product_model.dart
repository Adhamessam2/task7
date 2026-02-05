class ProductModel {
  final String image;
  final String title;
  final String description;
  static List<ProductModel> productslist = [
    ProductModel("assets/image 5.png", "Burger Combo", "Delicious burger"),
    ProductModel('assets/pizza.png', "Pizza", "freshly baked pizza"),
  ];

  ProductModel(this.image, this.title, this.description);
}
