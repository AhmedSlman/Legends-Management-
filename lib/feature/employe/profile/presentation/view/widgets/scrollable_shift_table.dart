import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legends_management/core/utils/app_styles.dart';
import 'package:legends_management/core/widgets/custom_button.dart';
import 'package:legends_management/core/widgets/shimmer.dart';
import '../../../../../../core/widgets/time_card.dart';
import '../../../../../admin/shifts/model/shifts_model.dart';
import '../../viewmodel/employee_shifts/employee_shift_cubit.dart';

import '../../viewmodel/endshift/end_shift_cubit.dart';
import '../../viewmodel/startshift/start_shift_cubit.dart'; // Import StartShiftCubit

class ScrollableShiftTable extends StatelessWidget {
  const ScrollableShiftTable({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EmployeeShiftCubit()..getEmployeeShifts(),
        ),
        BlocProvider(
          create: (context) => StartShiftCubit(), // Initialize StartShiftCubit
        ),
        BlocProvider(
          create: (context) => EndShiftCubit(), // Initialize EndShiftCubit
        ),
      ],
      child: BlocListener<StartShiftCubit, StartShiftState>(
        listener: (context, state) {
          if (state is StartShiftSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is StartShiftFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errMsg)),
            );
          }
        },
        child: BlocBuilder<EmployeeShiftCubit, EmployeeShiftState>(
          builder: (context, state) {
            if (state is EmployeeShiftLoading) {
              return const Center(
                child: ShimmerTaskCard(),
              );
            } else if (state is EmployeeShiftFailure) {
              return Center(child: Text('Error: ${state.errMsg}'));
            } else if (state is EmployeeShiftSuccess) {
              // Check if there are any shifts
              if (state.shiftsModel.data == null ||
                  state.shiftsModel.data!.isEmpty) {
                return Center(
                  child: Text(
                    'No shifts available',
                    style: AppStyles.styleRegular14(context),
                  ),
                );
              }
              return _buildShiftTable(context, state.shiftsModel);
            }
            return const SizedBox.shrink(); // Return empty if no state matches
          },
        ),
      ),
    );
  }

  // Build shift table when shifts are loaded successfully
  Widget _buildShiftTable(BuildContext context, ShiftsModel shifts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: const Color(0xff1A1A1A),
          height: 500.h,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(2),
                3: FlexColumnWidth(1), // Add column for the Start button
              },
              children: shifts.data!.map<TableRow>((shift) {
                // Pass the shift data to buildShiftRow
                return buildShiftRow(shift, context);
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  // Helper method to determine if it's a day shift
  bool _isDayShift(String from, String to) {
    final fromTime = TimeOfDay(
      hour: int.parse(from.split(':')[0]),
      minute: int.parse(from.split(':')[1]),
    );
    return fromTime.hour < 16;
  }

  TableRow buildShiftRow(ShiftsData shift, BuildContext context) {
    print("Building row for shift ID: ${shift.id}"); // Debugging line

    bool dayShift = _isDayShift(shift.from ?? '', shift.to ?? '');
    bool nightShift = !dayShift;

    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            shift.day ?? '',
            style: AppStyles.styleRegular14(context),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.h),
          child: dayShift
              ? TimeCardRow(
                  startTime: formatTime(shift.from ?? '00:00'),
                  startPeriod: _getPeriod(shift.from ?? '00:00'),
                  endTime: formatTime(shift.to ?? '00:00'),
                  endPeriod: _getPeriod(shift.to ?? '00:00'),
                )
              : const Center(
                  child: Text('No Day Shift',
                      style: TextStyle(color: Colors.white)),
                ),
        ),
        Padding(
          padding: EdgeInsets.all(8.h),
          child: nightShift
              ? TimeCardRow(
                  startTime: formatTime(shift.from ?? '00:00'),
                  startPeriod: _getPeriod(shift.from ?? '00:00'),
                  endTime: formatTime(shift.to ?? '00:00'),
                  endPeriod: _getPeriod(shift.to ?? '00:00'),
                )
              : const Center(
                  child: Text('No Night Shift',
                      style: TextStyle(color: Colors.white)),
                ),
        ),
        // Add Start and End icon buttons
        Padding(
          padding: EdgeInsets.all(8.h),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.play_arrow, color: Colors.green),
                onPressed: () {
                  // Start the shift
                  BlocProvider.of<StartShiftCubit>(context)
                      .startShift(shiftId: shift.id.toString());
                },
                tooltip: 'Start Shift',
              ),
              IconButton(
                icon: const Icon(Icons.stop, color: Colors.red),
                onPressed: () {
                  // End the shift
                  BlocProvider.of<EndShiftCubit>(context)
                      .endShift(shiftId: shift.id.toString());
                },
                tooltip: 'End Shift',
              ),
            ],
          ),
        ),
      ],
    );
  }

  String formatTime(String time) {
    if (time != '00:00') {
      // Split the string to get hour and minutes
      final parts = time.split(':');
      // Return the formatted time (HH:MM)
      return '${parts[0]}:${parts[1]}';
    }
    return time;
  }

  String _getPeriod(String time) {
    final hour = int.parse(time.split(':')[0]);
    return hour < 12 ? 'AM' : 'PM';
  }
}
