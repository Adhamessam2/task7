import 'package:flutter/material.dart';
import 'package:task7/cart/cart.dart';
import 'package:task7/home/models/product_model.dart';

import 'product_states.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel product;
  const ProductDetails({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const .symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Stack(
                alignment: .topRight,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(product.image)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      iconColor: Colors.red,
                    ),
                    child: Icon(Icons.favorite),
                  ),
                  Positioned(
                    left: 0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        iconColor: Colors.black,
                      ),
                      child: Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(fontSize: 26, fontWeight: .bold),
                  ),
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: .bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  Productstats(
                    icon: Icons.star,
                    text: "4.8",
                    text2: "128 reviews",
                    color: Colors.yellow,
                  ),
                  Productstats(
                    icon: Icons.timer_outlined,
                    text: "20",
                    text2: "Mins",
                    color: Colors.red,
                  ),
                  Productstats(
                    icon: Icons.local_fire_department,
                    text: "350",
                    text2: "Kcal",
                    color: Colors.red,
                  ),
                ],
              ),
              SizedBox(height: 25),
              Text(
                "Description",
                style: TextStyle(fontSize: 24, fontWeight: .bold),
              ),
              SizedBox(height: 10),
              Text(
                "A succulent flame -grilled Angus beef \npatty...",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: .w400,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Sse more",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .w700,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Ingredients",
                style: TextStyle(fontSize: 24, fontWeight: .bold),
              ),
              SizedBox(height: 4),
              Row(
                spacing: 5,
                children: [
                  _ingredients("assets/beef.png", "Beef patty"),
                  _ingredients("assets/cheese.png", "Cheddar"),
                ],
              ),
              Row(
                spacing: 5,
                children: [
                  _ingredients("assets/lettuce.png", "Lettuce"),
                  _ingredients("assets/tomato.png", "Tomato"),
                ],
              ),
              SizedBox(height: 15),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cart()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: Size(340, 60),
                    shape: RoundedRectangleBorder(borderRadius: .circular(24)),
                  ),
                  child: Text(
                    "Add to cart",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: .bold,
                      color: Colors.white,
                    ),
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

Widget _ingredients(String image, String text) {
  return Container(
    margin: .symmetric(horizontal: 10),
    padding: .symmetric(horizontal: 10, vertical: 8),
    decoration: BoxDecoration(borderRadius: .circular(24), color: Colors.white),
    child: Row(
      mainAxisAlignment: .center,
      spacing: 5,
      children: [Image.asset(image, height: 20), Text(text)],
    ),
  );
}
