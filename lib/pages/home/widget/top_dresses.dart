import 'package:flutter/material.dart';

class TopDresses extends StatelessWidget {
const TopDresses({super.key});

@override
Widget build(BuildContext context) {
final dresses = [
  {
    "brand": "Roller Rabbit",
    "name": "Vado Odelle Dress",
    "price": "\$198.00",
    "image": "assets/images/shoes.png",
  },
  {
    "brand": "endless rose",
    "name": "Bubble Elastic T-shirt",
    "price": "\$50.00",
    "image": "assets/images/bag_promo.png",
  },
  {
    "brand": "Theory",
    "name": "Irregular Rib Skirt",
    "price": "\$345.00",
    "image": "assets/images/shoes.png",
  },
  {
    "brand": "Madewell",
    "name": "Giselle Top in White Linen",
    "price": "\$69.50",
    "image": "assets/images/bag_promo.png",
  },
];

return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "Clothes",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
    const SizedBox(height: 10),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dresses.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 16,
          childAspectRatio: 0.68,
        ),
        itemBuilder: (context, index) {
          final item = dresses[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      item['image']!,
                      width: double.infinity,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Positioned(
                    top: 10,
                    right: 10,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.black,
                      child: Icon(Icons.favorite_border, color: Colors.white, size: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                item['brand']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                item['name']!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item['price']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          );
        },
      ),
    ),
  ],
);
}
}