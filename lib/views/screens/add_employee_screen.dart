import 'package:dars_4_uy_ishi/controllers/company_controller.dart';
import 'package:dars_4_uy_ishi/models/employee.dart';
import 'package:dars_4_uy_ishi/views/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AddEmployeeScreen extends StatelessWidget {
  final CompanyController companyController = CompanyController();

  final nameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController positionController = TextEditingController();

  final TextEditingController skillsController = TextEditingController();

  AddEmployeeScreen({super.key});
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
                  hintText: "Enter name",
                  suffixIcon: Icon(
                    Icons.person,
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
                controller: ageController,
                decoration: const InputDecoration(
                  hintText: "Enter age",
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
                controller: positionController,
                decoration: const InputDecoration(
                  hintText: "Enter position",
                  suffixIcon: Icon(
                    Icons.people,
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
                controller: skillsController,
                decoration: const InputDecoration(
                  hintText: "Enter skills by comma",
                  suffixIcon: Icon(
                    Icons.person,
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
                companyController.addEmployee(Employee(
                    name: nameController.text,
                    age: int.parse(ageController.text),
                    position: positionController.text,
                    skills: skillsController.text.split(",").toList()));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
              child: const Text(
                "Add Employee",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
