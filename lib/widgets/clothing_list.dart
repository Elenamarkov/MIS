import 'package:flutter/material.dart';
import '../screens/product_details.dart';

class ClothingList extends StatelessWidget {
  const ClothingList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> clothingItems = [
      {
        'name': 'Маица',
        'image': 'https://via.placeholder.com/150',
        'description': 'Памучна маица со кратки ракави.',
        'price': '10 EUR',
      },
      {
        'name': 'Фармерки',
        'image': 'https://via.placeholder.com/150',
        'description': 'Фармерки со класичен крој.',
        'price': '25 EUR',
      },
      {
        'name': 'Јакна',
        'image': 'https://via.placeholder.com/150',
        'description': 'Топла зимска јакна.',
        'price': '50 EUR',
      },
    ];

    return ListView.builder(
      itemCount: clothingItems.length,
      itemBuilder: (context, index) {
        final item = clothingItems[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(item: item),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      item['image']!,
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          item['price']!,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
