import 'package:flutter/material.dart';
import 'package:task7/home/models/offers_model.dart';

class OffersProducts extends StatelessWidget {
  const OffersProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: OffersModel.offersproduct.length,
        itemBuilder: (BuildContext context, int index) {
          return _offerscontainer(products: OffersModel.offersproduct[index]);
        },
      ),
    );
  }
}

Widget _offerscontainer({required OffersModel products}) {
  return Expanded(
    child: Container(
      margin: .symmetric(horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Stack(
            children: [
              Image.asset(products.image),
              Positioned(
                left: 10,
                top: 10,
                child: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      products.header,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: .bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            products.description,
            style: TextStyle(fontSize: 16, fontWeight: .bold),
          ),
        ],
      ),
    ),
  );
}
