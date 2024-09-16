import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_images.dart';

class ShiftsTable extends StatelessWidget {
  const ShiftsTable({super.key});

  // Example list of data for the shifts (ID, Name, Department, Phone)
  final List<Map<String, String>> shiftData = const [
    {
      "ID": "1021121221",
      "Name": "John Doe",
      "Department": "Sales",
      "Phone": "555-1234"
    },
    {
      "ID": "2",
      "Name": "Jane Smith",
      "Department": "Marketing",
      "Phone": "555-5678"
    },
    {
      "ID": "3",
      "Name": "Alice Johnson",
      "Department": "HR",
      "Phone": "555-9876"
    },
    {
      "ID": "4",
      "Name": "Robert Brown",
      "Department": "IT",
      "Phone": "555-4321"
    },
    {
      "ID": "4",
      "Name": "Robert Brown",
      "Department": "IT",
      "Phone": "555-4321"
    },
    {
      "ID": "4",
      "Name": "Robert Brown",
      "Department": "IT",
      "Phone": "555-4321"
    },
    {
      "ID": "4",
      "Name": "Robert Brown",
      "Department": "IT",
      "Phone": "555-4321"
    },
    {
      "ID": "4",
      "Name": "Robert Brown",
      "Department": "IT",
      "Phone": "555-4321"
    },
    {
      "ID": "4",
      "Name": "Robert Brown",
      "Department": "IT",
      "Phone": "555-4321"
    },
    {
      "ID": "4",
      "Name": "Robert Brown",
      "Department": "IT",
      "Phone": "555-4321"
    },
    // Add more rows as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Table headers
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Text(
                'ID',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                'Name',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                'Department',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                'Phone',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        const Divider(color: Colors.black, thickness: 1.5),
        // Table rows (using ListView.builder)
        Expanded(
          child: ListView.builder(
            itemCount: shiftData.length,
            itemBuilder: (context, index) {
              final shift = shiftData[index];
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 15,
                              child: Image.asset(Assets.imagesLogo),
                            ),
                            const SizedBox(
                                width: 8), // Spacing between avatar and text
                            Text(
                              shift["ID"]!,
                              style: const TextStyle(
                                  color:
                                      Colors.white), // ID text next to avatar
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          shift["Name"]!,
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          shift["Department"]!,
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          shift["Phone"]!,
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.black, thickness: 1.5),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}