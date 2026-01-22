import 'package:flutter/material.dart';
import 'package:praktikumuiux_7020230051/widgets/product_card.dart';
import 'package:praktikumuiux_7020230051/screens/cart_screen.dart';
import 'package:praktikumuiux_7020230051/screens/profile_screen.dart';
import 'package:praktikumuiux_7020230051/models/product_models.dart' hide Product, ProductCard;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ProductGridScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Cari produk impian...",
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            )
          : null,
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Keranjang',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

class ProductGridScreen extends StatelessWidget {
  
  final List<Product> products = [
    Product(
      name: "MacBook Pro",
      price: "Rp 25.000.000",
      image: "assets/images",
      description:
          "Laptop performa tinggi untuk profesional dan kreator konten.",
    ),
    Product(
      name: "iPhone 15",
      price: "Rp 15.000.000",
      image: "assets/images",
      description: "Smartphone flagship dengan teknologi kamera terbaru.",
    ),
    Product(
      name: "iPad Pro",
      price: "Rp 18.000.000",
      image: "assets/images",
      description:
          "Tablet powerful dengan layar ProMotion untuk produktivitas.",
    ),
    Product(
      name: "Apple Watch Series 9",
      price: "Rp 7.500.000",
      image: "assets/images",
      description: "Smartwatch pintar dengan fitur kesehatan lengkap.",
    ),
    Product(
      name: "AirPods Pro",
      price: "Rp 4.000.000",
      image: "assets/images",
      description: "Earbuds dengan Active Noise Cancellation dan audio jernih.",
    ),
    Product(
      name: "MacBook Air M2",
      price: "Rp 19.000.000",
      image: "assets/images",
      description: "Laptop ringan dan cepat dengan chip Apple M2.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Produk Terbaru",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length, 
              itemBuilder: (context, index) {
                final product = products[index]; 

                return ProductCard(
                  product: product, 
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
