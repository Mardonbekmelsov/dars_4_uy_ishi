import 'package:dars_4_uy_ishi/controllers/company_controller.dart';
import 'package:dars_4_uy_ishi/models/product.dart';
import 'package:dars_4_uy_ishi/views/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  final CompanyController companyController = CompanyController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();

  AddProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Enter product name",
                  suffixIcon: Icon(
                    Icons.production_quantity_limits_outlined,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 250,
              child: TextField(
                controller: priceController,
                decoration: const InputDecoration(
                  hintText: "Enter price",
                  suffixIcon: Icon(
                    Icons.numbers,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 250,
              child: TextField(
                controller: stockController,
                decoration: const InputDecoration(
                  hintText: "in stock? yes/no",
                  suffixIcon: Icon(
                    Icons.stacked_bar_chart_rounded,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                companyController.addProduct(Product(
                    name: nameController.text,
                    price: double.parse(priceController.text),
                    inStock: stockController.text == "yes"));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
              },
              child: const Text(
                "Add Product",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
