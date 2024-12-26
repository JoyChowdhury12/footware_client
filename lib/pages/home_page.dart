import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:footware_client/controller/home_controller.dart';
import 'package:footware_client/controller/login_controller.dart';
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
    return GetBuilder<HomeController>(builder: (ctrl) {
      return RefreshIndicator(
        onRefresh: () async {
          ctrl.fetchProduct();
        },
        child: Scaffold(
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
                    Get.snackbar(
                        "Logged successful!", "Logged out successfully",
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
                    itemCount: ctrl.productCategories.length,
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            ctrl.filterByCategory(
                                ctrl.productCategories[index].name ?? "");
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Chip(
                                label: Text(
                                    ctrl.productCategories[index].name ??
                                        "Error")),
                          ),
                        )),
              ),
              Row(
                children: [
                  Flexible(
                    child: DropDownBtn(
                        items: ["TK : Low to High", "TK : High to Low"],
                        selectedItemText: "Sort",
                        onSelected: (selected) {
                          ctrl.sortByPrice(
                              ascending: selected == "TK : Low to High"
                                  ? true
                                  : false);
                        }),
                  ),
                  Flexible(
                      child: MultiSelectDropDown(
                    items: ["Puma", "Nike", "Adidas"],
                    onSelectionChanged: (selectedItems) {
                      ctrl.filterByBrand(selectedItems);
                    },
                  )),
                ],
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: ctrl.productShowInUi.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) {
                      return ProductCard(
                        name: ctrl.productShowInUi[index].name ?? "No Name",
                        imageUrl: ctrl.productShowInUi[index].image ?? "url",
                        price: ctrl.productShowInUi[index].price ?? 00,
                        offerTag: '20% off',
                        onTap: () {
                          Get.to(
                            ProductDescriptionPage(),
                          );
                        },
                      );
                    }),
              )
            ],
          ),
        ),
      );
    });
  }
}
