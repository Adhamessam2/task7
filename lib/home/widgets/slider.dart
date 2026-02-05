import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:task7/home/widgets/products_container.dart';

class CarouselViewToggle extends StatefulWidget {
  const CarouselViewToggle({super.key});

  @override
  State<CarouselViewToggle> createState() => _CarouselViewToggleState();
}

class _CarouselViewToggleState extends State<CarouselViewToggle> {
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
            children: [
              _segment('List View', Colors.transparent),
              _segment('Grid View', Colors.red),
            ],
          ),
        ),
        const SizedBox(height: 10),
        CarouselSlider(
          // carouselController: _controller,
          options: CarouselOptions(
            height: 250,
            viewportFraction: 1,
            enableInfiniteScroll: false,
          ),
          items: [_page()],
        ),
      ],
    );
  }

  Widget _segment(String title, Color color) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          title,
          style: TextStyle(color: Colors.black38, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _page() {
    return ProductsContainer();
  }
}
