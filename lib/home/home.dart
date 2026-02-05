import 'package:flutter/material.dart';
import 'package:task7/home/widgets/navbar_items.dart';
import 'package:task7/home/widgets/offers_products.dart';
import 'package:task7/home/widgets/slider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food delivery", style: TextStyle(fontWeight: .bold)),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_rounded)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.redAccent.withValues(alpha: .1),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: .circular(24),
                  borderSide: .none,
                ),
                hint: Text("Search For Food"),
                prefixIcon: Icon(Icons.search, color: Colors.red),
              ),
            ),
            SizedBox(height: 8),
            OffersProducts(),
            Text(
              "Featured items",
              style: TextStyle(fontSize: 20, fontWeight: .bold),
            ),
            SizedBox(height: 10),
            CarouselViewToggle(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            NavItem(icon: Icons.home, label: 'Home', color: Colors.red),
            NavItem(
              icon: Icons.shopping_cart,
              label: 'Cart',
              color: Colors.grey,
            ),
            NavItem(
              icon: Icons.person_outline,
              label: 'Profile',
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
