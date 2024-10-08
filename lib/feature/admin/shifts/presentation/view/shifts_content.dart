import 'package:flutter/material.dart';

import 'widgets/shifts_header.dart';
import 'widgets/shifts_table.dart';

class ShiftsContent extends StatelessWidget {
  const ShiftsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SearchAndNotificationSection(),
          SizedBox(height: 20),
          ShiftsHeader(),
          SizedBox(height: 20),
          Expanded(
            child: ShiftsTable(),
          ),
        ],
      ),
    );
  }
}
