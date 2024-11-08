import 'package:flutter/material.dart';

class ProductContainer extends StatelessWidget {
  final String title, image;
  final int price, id;
  final Size size;

  const ProductContainer({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.id,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width > 600 ? 300 : 250,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: id % 2 == 0
            ? const Color.fromRGBO(216, 240, 253, 1)
            : const Color.fromRGBO(245, 247, 249, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 5),
          Text(
            "$price",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 5),
          Center(
            child: Image.asset(
              image,
              height: size.width > 600 ? 500 : 150,
            ),
          ),
        ],
      ),
    );
  }
}
