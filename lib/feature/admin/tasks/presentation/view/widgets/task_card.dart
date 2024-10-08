import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../viewmodel/updatetask/update_task_cubit.dart';

class TaskCard extends StatelessWidget {
  final String taskName;
  final String taskDetails;
  final String status;
  final double value;
  final bool canUpdate;
  final String? taskId;

  const TaskCard({
    super.key,
    required this.taskName,
    required this.taskDetails,
    required this.status,
    required this.value,
    required this.canUpdate,
    this.taskId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black87,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    taskName,
                    style: AppStyles.styleRegular16(context),
                  ),
                ),
                if (canUpdate)
                  IconButton(
                    onPressed: () {
                      _showStatusUpdateDialog(context, taskId!);
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.orange,
                      size: 24.sp,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              'Details: $taskDetails',
               style: AppStyles.styleRegular16(context).copyWith(color: Colors.grey[300]),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Text(
                  'Status:',
                  style: AppStyles.styleRegular16(context).copyWith(color: Colors.grey[300]),
                ),
                SizedBox(width: 8.w),
                _buildStatusText(status,context),
              ],
            ),
            SizedBox(height: 15.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: LinearProgressIndicator(
                value: value,
                backgroundColor: Colors.grey[700],
                color: Colors.green,
                minHeight: 8.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusText(String status,BuildContext context) {
    Color statusColor = status == 'completed' ? Colors.green : Colors.red;

    return Row(
      children: [
        Icon(
          status == 'completed' ? Icons.check_circle : Icons.cancel,
          color: statusColor,
          size: 16.sp,
        ),
        SizedBox(width: 4.w),
        Text(
          status,
           style: AppStyles.styleRegular16(context),
        ),
      ],
    );
  }

  void _showStatusUpdateDialog(BuildContext context, String taskId) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text(
            'Update Task Status',
            style: TextStyle(color: Colors.white), // Title color
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Mark as Completed Button
                CustomButton(
                  backgroundcolor: Colors.green, // Button color
                  textColor: Colors.white,
                  buttonText: 'Mark as Completed',
                  onPressed: () {
                    context.read<UpdateTaskCubit>().updateStatus(
                          status: 'completed',
                          id: taskId,
                        );
                    Navigator.pop(context); // Close the dialog after updating
                  },
                  width: double.infinity, // Full width
                ),
                SizedBox(height: 10.h), // Spacing between buttons
                // Mark as Pending Button
                CustomButton(
                  backgroundcolor: Colors.orange, // Button color
                  textColor: Colors.white,
                  buttonText: 'Mark as Pending',
                  onPressed: () {
                    context.read<UpdateTaskCubit>().updateStatus(
                          status: 'pending',
                          id: taskId,
                        );
                    Navigator.pop(context);
                  },
                  width: double.infinity, // Full width
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
