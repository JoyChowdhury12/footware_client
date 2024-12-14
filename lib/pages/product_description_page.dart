import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductDescriptionPage extends StatelessWidget {
  const ProductDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Product Details",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "https://res.cloudinary.com/dkfivkb0o/image/upload/v1734156541/footwear%20app/jordan%204.png",
                fit: BoxFit.contain,
                width: double.infinity,
                height: 200,
              ),
            ),
            Gap(20),
            Text(
              "Nike Air Jordan 4",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Gap(20),
            Text(
              "Product Description",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            Gap(20),
            Text(
              "BDT : 4700",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Gap(20),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: "Enter your Billing Address"),
            ),
            Gap(22),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 22),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepPurple,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Buy Now",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
