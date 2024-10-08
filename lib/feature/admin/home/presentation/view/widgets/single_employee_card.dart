import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legends_management/core/utils/app_images.dart';
import 'package:legends_management/core/utils/app_styles.dart';
import '../../../../department/presentation/viewmodel/ratingcubit/rating_cubit.dart';
import '../../../data/models/all_employees_model.dart';
import 'text_info.dart';

class SingleEmployeeCard extends StatelessWidget {
  const SingleEmployeeCard({
    super.key,
    required this.allEmployees,
  });

  final AllEmplyeesModel allEmployees;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355.w,
      height: 415.h,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 26, 24, 32),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 35.r,
                  child: SvgPicture.asset(
                    Assets.imagesUsersvg,
                  ),
                ),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      allEmployees.name ?? 'employeeName',
                      style: AppStyles.styleSemiBold20(context),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      allEmployees.role ?? 'Project manager',
                      style: AppStyles.styleRegularGrey16(context),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    _showRatingDialog(
                      context,
                      allEmployees.id.toString(),
                    );
                  },
                  child: Icon(
                    Icons.star,
                    color: Colors.yellowAccent,
                    size: 24.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.h),
            TextInfo(
              label: 'Department',
              value: allEmployees.department?.name ?? 'Development',
            ),
            SizedBox(height: 10.h),
            TextInfo(label: 'Email', value: allEmployees.email ?? ''),
            SizedBox(height: 10.h),
            TextInfo(label: 'Phone', value: allEmployees.phone ?? ''),
            SizedBox(height: 10.h),
            TextInfo(
              label: 'Bank Account',
              value: allEmployees.bankAccount.toString(),
            ),
            SizedBox(height: 10.h),
            TextInfo(
              label: 'Status',
              value: allEmployees.level?.name ?? 'Junior',
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  void _showRatingDialog(BuildContext context, String? employeeId) {
    final TextEditingController ratingController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Rate Employee'),
          content: TextField(
            controller: ratingController,
            decoration: const InputDecoration(labelText: 'Enter Rating'),
            keyboardType: TextInputType.number,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Dispatch the rating action
                final rating = ratingController.text;

                // Ensure the employee ID is not null
                if (employeeId != null && rating.isNotEmpty) {
                  BlocProvider.of<RatingCubit>(context)
                      .addReating(rating: rating, id: employeeId);

                  // Optionally, show a success message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Rating submitted successfully!')),
                  );
                }

                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
