
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScrollableShiftTableAdmin extends StatelessWidget {
  const ScrollableShiftTableAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff1A1A1A), // Background color
      height: 500.h, // Set height for the table
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Table(
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(2),
          },
          children: _buildPlaceholderRows(),
        ),
      ),
    );
  }

  // Method to build placeholder rows
  List<TableRow> _buildPlaceholderRows() {
    List<TableRow> rows = [];
    for (int i = 0; i < 7; i++) {
      // Creating 7 rows for 7 days
      rows.add(
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Day ${i + 1}', // Placeholder for day name
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: const Center(
                child:
                    Text('No Day Shift', style: TextStyle(color: Colors.white)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: const Center(
                child: Text('No Night Shift',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      );
    }
    return rows; // Return the list of rows
  }
}