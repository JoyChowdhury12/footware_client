import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:footware_client/pages/login_page.dart';
import 'package:footware_client/pages/product_description_page.dart';
import 'package:footware_client/widgets/drop_down_button.dart';
import 'package:footware_client/widgets/multi_select_drop_down.dart';
import 'package:footware_client/widgets/product_card.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Footwear Store",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Get.offAll(LoginPage());
                Get.snackbar("Logged successful!", "Logged out successfully",
                    colorText: Colors.deepPurple);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Chip(label: Text("Catergory")),
                    )),
          ),
          Row(
            children: [
              Flexible(
                child: DropDownBtn(
                    items: ["TK : Low to High", "TK : High to Low"],
                    selectedItemText: "Sort",
                    onSelected: (selected) {}),
              ),
              Flexible(
                  child: MultiSelectDropDown(
                items: ["Puma", "Nike", "Adidas"],
                onSelectionChanged: (selectedItems) {},
              )),
            ],
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    name: 'Puma Footwear',
                    imageUrl:
                        'https://res.cloudinary.com/dkfivkb0o/image/upload/v1734156541/footwear%20app/jordan%204.png',
                    price: 200,
                    offerTag: '30% off',
                    onTap: () {
                      Get.to(ProductDescriptionPage());
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
