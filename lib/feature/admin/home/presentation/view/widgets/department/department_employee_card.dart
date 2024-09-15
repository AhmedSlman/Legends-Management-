import 'package:flutter/material.dart';
import 'package:legends_management/core/utils/app_images.dart';

class DepartmentEmployeeCard extends StatelessWidget {
  const DepartmentEmployeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff151515),
      child: ListTile(
        leading: CircleAvatar(
          child: Image.asset(
            Assets.imagesLogo,
          ),
        ),
        title: const Text(
          'Sophia  Harris',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        subtitle: const Text(
          '456272923774922',
          style: TextStyle(
            color: Color(0xff535353),
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
      ),
    );
  }
}
