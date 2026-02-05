import 'package:flutter/material.dart';
import 'package:task7/home/models/product_model.dart';

class ProductsContainer extends StatelessWidget {
  const ProductsContainer({super.key});

  @override
  Widget build(BuildContext context) {
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

        return Container(
          padding: .symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Image.asset(product.image),
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
              const Spacer(),
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
}
