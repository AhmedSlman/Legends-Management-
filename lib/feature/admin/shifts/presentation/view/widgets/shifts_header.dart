import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../viewmodel/cubit/create_shift_cubit.dart';
import 'create_shift_bottom_Sheet.dart';

class ShiftsHeader extends StatelessWidget {
  const ShiftsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Shifts',
          style: AppStyles.styleBold40(context),
        ),
        GestureDetector(
          onTap: () {
            _showCreateShiftBottomSheet(context);
          },
          child: SvgPicture.asset(Assets.imagesAddbutton),
        ),
      ],
    );
  }

  void _showCreateShiftBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.black,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return BlocProvider<CreateShiftCubit>(
          create: (context) => CreateShiftCubit(),
          child: BlocListener<CreateShiftCubit, CreateShiftState>(
            listener: (context, state) {
              if (state is CreateShiftSuccess) {
                // Close the bottom sheet
                Navigator.pop(context);
                // Show success message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Shift created successfully')),
                );
              } else if (state is CreateShiftFailure) {
                // Show error message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errMsg)),
                );
              }
            },
            child: const CreateShiftBottomSheet(),
          ),
        );
      },
    );
  }
}