import 'package:flutter/material.dart';
import 'package:task7/home/models/product_model.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

double get subtotal {
  double sum = 0;
  for (var product in ProductModel.productslist) {
    sum += product.price * product.quantity;
  }
  return sum;
}

double get deliveryFee => 5;
double get taxes => subtotal * 0.1;
double get total => subtotal + taxes + deliveryFee;

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart", style: TextStyle(fontSize: 22, fontWeight: .bold)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: ProductModel.productslist.length,
              itemBuilder: (BuildContext context, int index) {
                final products = ProductModel.productslist[index];
                return ListTile(
                  leading: Image.asset(products.image),
                  title: Text(products.title),
                  subtitle: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text("Size:large"),
                      Text(
                        "Burger Palace",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: .min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (products.quantity == 1) return;
                            products.quantity--;
                          });
                        },
                        style: ElevatedButton.styleFrom(shape: CircleBorder()),
                        child: Icon(Icons.remove, color: Colors.black45),
                      ),
                      Text(products.quantity.toString()),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            products.quantity++;
                          });
                        },
                        style: ElevatedButton.styleFrom(shape: CircleBorder()),
                        child: Icon(Icons.add, color: Colors.black45),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: .only(
                  topLeft: .circular(20),
                  topRight: .circular(20),
                ),
              ),
              child: Column(
                children: [
                  _row("Subtotal", subtotal),
                  _row("Delivery Fee", deliveryFee),
                  _row("Taxes", taxes),
                  SizedBox(height: 15),
                  Divider(),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(fontSize: 20, fontWeight: .bold),
                      ),
                      Text(
                        "\$$total",
                        style: TextStyle(fontSize: 20, fontWeight: .bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        fixedSize: Size(350, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: .circular(18),
                        ),
                      ),
                      child: Text(
                        "Checkout",
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
        ],
      ),
    );
  }
}

Widget _row(String title, double price) {
  return Row(
    mainAxisAlignment: .spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: .bold),
      ),
      Text("\$$price", style: TextStyle(fontSize: 16, fontWeight: .bold)),
    ],
  );
}
