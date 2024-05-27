import 'package:dars_4_uy_ishi/controllers/company_controller.dart';
import 'package:dars_4_uy_ishi/models/product.dart';
import 'package:dars_4_uy_ishi/views/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  final CompanyController companyController = CompanyController();
  TextEditingController nameController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController stockController = TextEditingController();
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
                decoration: InputDecoration(
                  hintText: "Enter product name",
                  suffixIcon: Icon(
                    Icons.production_quantity_limits_outlined,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 250,
              child: TextField(
                controller: priceController,
                decoration: InputDecoration(
                  hintText: "Enter price",
                  suffixIcon: Icon(
                    Icons.numbers,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 250,
              child: TextField(
                controller: stockController,
                decoration: InputDecoration(
                  hintText: "in stock? yes/no",
                  suffixIcon: Icon(
                    Icons.stacked_bar_chart_rounded,
                  ),
                ),
              ),
            ),
            SizedBox(
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              },
              child: Text(
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
