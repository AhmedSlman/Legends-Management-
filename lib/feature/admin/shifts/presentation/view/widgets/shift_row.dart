import 'package:flutter/material.dart';
import 'package:legends_management/core/utils/app_styles.dart';
import 'package:legends_management/core/widgets/time_card.dart'; // Adjust based on your actual import

class ShiftRow extends StatelessWidget {
  final String employeeName;
  final String startTime; // New property for start time
  final String startPeriod; // New property for start period
  final String endTime; // New property for end time
  final String endPeriod; // New property for end period
  final String day;
  final String status;
  

  const ShiftRow({
    super.key,
    required this.employeeName,
    required this.startTime,
    required this.startPeriod,
    required this.endTime,
    required this.endPeriod,
    required this.day,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildCell(employeeName, context), // Employee Name cell
          Expanded(
            child: TimeCardRow(
              startTime: startTime,
              startPeriod: startPeriod,
              endTime: endTime,
              endPeriod: endPeriod,
            ),
          ), // TimeCardRow for shift times
          _buildCell(day, context), // Department cell
          _buildCell(status, context), // Department cell
        ],
      ),
    );
  }

  Widget _buildCell(String value, BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black, width: 1.5),
          ),
        ),
        child: Text(
          value,
          style: AppStyles.styleRegular20(context),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
