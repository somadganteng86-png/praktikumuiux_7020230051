import 'package:flutter/material.dart';

// =====================
// 1. Model Product
// =====================
class Product {
  final String name;
  final String price;
  final String image;
  final String description;

  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });
}

// =====================
// 2. Dummy Data Produk
// =====================
List<Product> dummyProducts = [
  Product(
    name: "MacBook Pro",
    price: "Rp 25.000.000",
    image: "assets/images",
    description: "Laptop performa tinggi untuk profesional dan kreator konten.",
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
    description: "Tablet powerful dengan layar ProMotion untuk produktivitas.",
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
  Product(
    name: "iMac 24-inch",
    price: "Rp 22.000.000",
    image: "assets/images",
    description: "All-in-one desktop dengan desain tipis dan performa tinggi.",
  ),
];

// =====================
// 3. Product Card
// =====================
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Image.asset(
                product.image,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  product.price,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// =====================
// 4. Grid Produk (Home)
// =====================
class ProductGridScreen extends StatelessWidget {
  const ProductGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Produk Terbaru",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: GridView.builder(
              itemCount: dummyProducts.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  product: dummyProducts[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
