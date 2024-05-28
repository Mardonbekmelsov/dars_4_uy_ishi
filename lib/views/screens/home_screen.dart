import 'package:dars_4_uy_ishi/controllers/company_controller.dart';
import 'package:dars_4_uy_ishi/views/screens/add_employee_screen.dart';
import 'package:dars_4_uy_ishi/views/screens/add_product_screen.dart';
import 'package:dars_4_uy_ishi/views/widgets/employee_widget.dart';
import 'package:dars_4_uy_ishi/views/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CompanyController companyController = CompanyController();

  @override
  void initState() {
    super.initState();
    companyController.getEmployeesandProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Company"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const Text(
                "Employees",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              companyController.employees.isEmpty
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("This company haven't got employees"),
                      ],
                    )
                  : Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      children: [
                        for (var employee in companyController.employees)
                          EmployeeWidget(
                            employee: employee,
                            delete: () {
                              setState(() {
                                companyController.removeEmployee(employee);
                              });
                            },
                          ),
                      ],
                    ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Products",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              companyController.products.isNotEmpty
                  ? Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      children: [
                        for (var product in companyController.products)
                          ProductWidget(
                            product: product,
                            delete: () {
                              setState(() {
                                companyController.removeProduct(product);
                              });
                            },
                          ),
                      ],
                    )
                  : const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Haven't got products yet"),
                      ],
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddProductScreen()));
              });
            },
            child: const Column(
              children: [
                Icon(Icons.add),
                Text(
                  "product",
                ),
              ],
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddEmployeeScreen()));
              });
            },
            child: const Column(
              children: [
                Icon(Icons.add),
                Text(
                  "employee",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
