import 'package:dars_4_uy_ishi/models/employee.dart';
import 'package:dars_4_uy_ishi/models/product.dart';
import 'package:dars_4_uy_ishi/views/screens/edit_employee_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class EmployeeWidget extends StatelessWidget {
  Function() delete;
  Employee employee;
  EmployeeWidget({required this.employee, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        height: 200,
        width: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EmployeeEditScreen(employee: employee)));
                  },
                  child: Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),
                ),
                InkWell(
                  onTap: delete,
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Text(
              "name: ${employee.name}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "age: ${employee.age}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "position: ${employee.position}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "skills: ${employee.skills}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
