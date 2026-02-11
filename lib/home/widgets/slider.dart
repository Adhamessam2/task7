import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:task7/home/models/product_model.dart';
import 'package:task7/product_detailes/product_details.dart';

class CarouselViewToggle extends StatefulWidget {
  const CarouselViewToggle({super.key});

  @override
  State<CarouselViewToggle> createState() => _CarouselViewToggleState();
}

class _CarouselViewToggleState extends State<CarouselViewToggle> {
  int selectedindex = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.red.withValues(alpha: .15),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [_segment('List View', 1), _segment('Grid View', 0)],
          ),
        ),
        const SizedBox(height: 15),
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            height: 250,
            viewportFraction: 1,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(() {
                selectedindex = index;
              });
            },
          ),

          items: [_gridviewpage(), _listviewpage()],
        ),
      ],
    );
  }

  Widget _segment(String title, int index) {
    final selected = selectedindex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _controller.animateToPage(index);
          setState(() {
            selectedindex = index;
          });
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? Colors.red : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black45,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _gridviewpage() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.7,
      ),
      itemCount: ProductModel.productslist.length,
      itemBuilder: (context, index) {
        final product = ProductModel.productslist[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetails(product: product),
              ),
            );
          },
          child: Column(
            children: [
              Container(
                height: 110,
                width: 115,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: DecorationImage(image: AssetImage(product.image)),
                ),
              ),
              const SizedBox(height: 4),
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(fontSize: 18, fontWeight: .bold),
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(
                      color: Colors.grey,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              Container(
                margin: const EdgeInsets.all(7),
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.redAccent.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Center(child: Text("Add to cart")),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _listviewpage() {
    return ListView.builder(
      itemCount: ProductModel.productslist.length,
      itemBuilder: (BuildContext context, int index) {
        final products = ProductModel.productslist[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetails(product: products),
              ),
            );
          },
          child: ListTile(
            leading: Container(
              width: 100,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: .circular(12),
                image: DecorationImage(image: AssetImage(products.image)),
              ),
            ),
            title: Text(products.title),
            subtitle: Text(products.description),
            trailing: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.redAccent.withValues(alpha: .1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Center(child: Text("Add to cart")),
            ),
          ),
        );
      },
    );
  }
}
