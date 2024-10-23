import 'package:flutter/material.dart';
import 'package:my_hiro/widgets/product_category_widget.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> sampleStores = List.generate(
    10,
    (index) => {
      'name': 'Store $index',
      'location': 'Location $index',
      'distance': '${(index + 1) * 1.2} km',
      'imageUrl':
          'https://via.placeholder.com/150', // Placeholder for store images
    },
  );

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(title: const Text('Versatile'), onTap: () {}),
            ListTile(title: const Text('Fashion'), onTap: () {}),
            ListTile(title: const Text('Furniture & Home Decor'), onTap: () {}),
            ListTile(title: const Text('Groceries'), onTap: () {}),
            ListTile(title: const Text('Electronics'), onTap: () {}),
            // Add more menu items here
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // In home_screen.dart, update the PageView section:
            // Image Carousel
            SizedBox(
              height: 200,
              child: PageView(
                children: List.generate(
                  3,
                  (index) => Image.network(
                    'https://via.placeholder.com/600x200',
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: Colors.grey[200],
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.image_not_supported,
                          size: 50,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            // Product categories
            ProductCategory(title: 'Versatile', stores: sampleStores),
            ProductCategory(
                title: 'Clothing and Textiles', stores: sampleStores),
            ProductCategory(title: 'Fashion', stores: sampleStores),
            // Add more categories as needed
          ],
        ),
      ),
      // BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType
            .fixed, // This ensures color applies to all items.
        backgroundColor: Colors.green, // Apply the green color.
        selectedItemColor: Colors
            .white, // Optional: To change icon and text color when selected.
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Added Stores',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sell),
            label: 'Sell/View',
          ),
        ],
      ),
    );
  }
}
