import 'package:flutter/material.dart';
import 'package:my_hiro/widgets/storecard_widget.dart';

class ProductCategory extends StatelessWidget {
  final String title;
  final List<Map<String, String>> stores;

  const ProductCategory({super.key, 
    required this.title,
    required this.stores,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('See all'),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 175, // Height of each category section
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: stores.length,
            itemBuilder: (context, index) {
              final store = stores[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: StoreCard(
                  name: store['name']!,
                  location: store['location']!,
                  distance: store['distance']!,
                  imageUrl: store['imageUrl']!,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
