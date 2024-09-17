import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';

class PerformanceGraphSection extends StatelessWidget {
  const PerformanceGraphSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xff101013),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Your Performance Per Month',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 16.h),
          // Placeholder for bar chart
          Container(
            height: 450.h,
            width: double.infinity,
            color: const Color(0xff101013),
            child: const Center(
              child: EmployeePerformanceBarChart(),
            ),
          ),
        ],
      ),
    );
  }
}

class EmployeePerformanceBarChart extends StatelessWidget {
  const EmployeePerformanceBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff101013),
      padding: const EdgeInsets.all(16),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 100,
          barTouchData: BarTouchData(enabled: true),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  switch (value.toInt()) {
                    case 0:
                      return const Text('1/8');
                    case 1:
                      return const Text('2/8');
                    case 2:
                      return const Text('3/8');
                    case 3:
                      return const Text('4/8');
                    case 4:
                      return const Text('5/8');
                    case 5:
                      return const Text('6/8');
                    case 6:
                      return const Text('7/8');
                    default:
                      return const Text('');
                  }
                },
                reservedSize: 32,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 25,
                getTitlesWidget: (double value, TitleMeta meta) {
                  return Text(value.toInt().toString());
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                  borderRadius: BorderRadius.zero,
                  toY: 50,
                  color: Colors.red,
                  width: 20,
                ),
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  borderRadius: BorderRadius.zero,
                  toY: 75,
                  color: Colors.red,
                  width: 20,
                ),
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                  borderRadius: BorderRadius.zero,
                  toY: 25,
                  color: Colors.red,
                  width: 20,
                ),
              ],
            ),
            BarChartGroupData(
              x: 3,
              barRods: [
                BarChartRodData(
                  borderRadius: BorderRadius.zero,
                  toY: 100,
                  color: Colors.red,
                  width: 20,
                ),
              ],
            ),
            BarChartGroupData(
              x: 4,
              barRods: [
                BarChartRodData(
                  borderRadius: BorderRadius.zero,
                  toY: 50,
                  color: Colors.red,
                  width: 20,
                ),
              ],
            ),
            BarChartGroupData(
              x: 5,
              barRods: [
                BarChartRodData(
                  borderRadius: BorderRadius.zero,
                  toY: 90,
                  color: Colors.red,
                  width: 20,
                ),
              ],
            ),
            BarChartGroupData(
              x: 6,
              barRods: [
                BarChartRodData(
                  borderRadius: BorderRadius.zero,
                  toY: 70,
                  color: Colors.red,
                  width: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
