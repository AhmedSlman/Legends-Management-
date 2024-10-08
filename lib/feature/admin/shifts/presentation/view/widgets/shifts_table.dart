import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legends_management/core/utils/app_styles.dart';
import 'package:legends_management/core/widgets/shimmer.dart';
import 'package:legends_management/feature/admin/shifts/presentation/viewmodel/shiftscubit/shifts_cubit.dart';
import 'shift_row.dart'; // Ensure this is your ShiftRow widget

class ShiftsTable extends StatelessWidget {
  const ShiftsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Name',
                    style: AppStyles.styleRegularRed32(context),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Shift',
                    style: AppStyles.styleRegularRed32(context),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Day', // This should show the department
                    style: AppStyles.styleRegularRed32(context),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Status', // This should show the department
                    style: AppStyles.styleRegularRed32(context),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          const Divider(color: Colors.black, thickness: 1.5),
          // Shifts List
          BlocProvider(
            create: (context) => ShiftsCubit()..getShifts(),
            child: BlocBuilder<ShiftsCubit, ShiftsState>(
              builder: (context, state) {
                if (state is ShiftsLoading) {
                  return const Center(
                    child: ShimmerTaskCard(),
                  );
                } else if (state is ShiftsSuccess) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.shifts.length,
                      itemBuilder: (context, index) {
                        final shift = state.shifts[index];
                        return ShiftRow(
                          employeeName: shift.employeeName ?? 'Employer',
                          startTime:
                              formatTime(shift.from ?? 'N/A'), // Format time
                          startPeriod: getPeriod(shift.from),
                          endTime: formatTime(shift.to ?? 'N/A'), // Format time
                          endPeriod: getPeriod(shift.to),
                          day: state.shifts[index].day ?? 'N/A',
                          status: state.shifts[index].status ??
                              'N/A', // Show department here
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(
                      'There are no shifts, try to assign shifts',
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  String formatTime(String time) {
    if (time != 'N/A') {
      // Split the string to get hour and minutes
      final parts = time.split(':');
      // Return the formatted time (HH:MM)
      return '${parts[0]}:${parts[1]}';
    }
    return time;
  }

  String getPeriod(String? time) {
    if (time != null && time != 'N/A') {
      final hour = int.parse(time.split(':')[0]);
      return hour < 12 ? 'AM' : 'PM';
    }
    return '';
  }
}
