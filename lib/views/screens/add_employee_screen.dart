import 'package:dars_4_uy_ishi/controllers/company_controller.dart';
import 'package:dars_4_uy_ishi/models/employee.dart';
import 'package:dars_4_uy_ishi/views/screens/home_screen.dart';
import 'package:flutter/material.dart';

class addEmployeeScreen extends StatelessWidget {
  final CompanyController companyController = CompanyController();

  TextEditingController nameController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController positionController = TextEditingController();

  TextEditingController skillsController = TextEditingController();
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
                  hintText: "Enter name",
                  suffixIcon: Icon(
                    Icons.person,
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
                controller: ageController,
                decoration: InputDecoration(
                  hintText: "Enter age",
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
                controller: positionController,
                decoration: InputDecoration(
                  hintText: "Enter position",
                  suffixIcon: Icon(
                    Icons.people,
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
                controller: skillsController,
                decoration: InputDecoration(
                  hintText: "Enter skills by comma",
                  suffixIcon: Icon(
                    Icons.person,
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
                companyController.addEmployee(Employee(
                    name: nameController.text,
                    age: int.parse(ageController.text),
                    position: positionController.text,
                    skills: skillsController.text.split(",").toList()));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Text(
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
