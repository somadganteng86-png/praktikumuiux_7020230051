import 'package:flutter/material.dart';

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

// Data Dummy
List<Product> dummyProducts = [
  Product(
    name: "MacBook Pro",
    price: "Rp 25.000.000",
    image: "assets/images.png",
    description: "Laptop performa tinggi untuk profesional dan kreator konten.",
  ),
  Product(
    name: "iPhone 15",
    price: "Rp 15.000.000",
    image: "assets/images.png",
    description: "Smartphone flagship dengan teknologi kamera terbaru.",
  ),
  Product(
    name: "iPad Pro",
    price: "Rp 18.000.000",
    image: "assets/images.png",
    description: "Tablet powerful dengan layar ProMotion untuk produktivitas.",
  ),
  Product(
    name: "Apple Watch Series 9",
    price: "Rp 7.500.000",
    image: "assets/images.png",
    description: "Smartwatch pintar dengan fitur kesehatan lengkap.",
  ),
  Product(
    name: "AirPods Pro",
    price: "Rp 4.000.000",
    image: "assets/images.png",
    description: "Earbuds dengan Active Noise Cancellation dan audio jernih.",
  ),
  Product(
    name: "MacBook Air M2",
    price: "Rp 19.000.000",
    image: "assets/images.png",
    description: "Laptop ringan dan cepat dengan chip Apple M2.",
  ),
  Product(
    name: "iMac 24-inch",
    price: "Rp 22.000.000",
    image: "assets/images.png",
    description: "All-in-one desktop dengan desain tipis dan performa tinggi.",
  ),
];

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                // INI AKAN MEMBERITAHU ANDA DI TERMINAL JIKA GAMBAR ERROR
                errorBuilder: (context, error, stackTrace) {
                  print("GAGAL MEMUAT GAMBAR: ${product.image}");
                  return Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.broken_image, color: Colors.red),
                          Text(
                            "File Not Found",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(product.price, style: const TextStyle(color: Colors.blue)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
