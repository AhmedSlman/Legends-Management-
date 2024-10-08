import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../tasks/presentation/view/widgets/current_tasks_header.dart';
import '../../viewmodel/cubit/create_shift_cubit.dart';

class CreateShiftBottomSheet extends StatefulWidget {
  const CreateShiftBottomSheet({super.key});

  @override
  State<CreateShiftBottomSheet> createState() => _CreateShiftBottomSheetState();
}

class _CreateShiftBottomSheetState extends State<CreateShiftBottomSheet> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();
  String? _selectedEmployeeId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Create New Shift',
                  style: AppStyles.styleRegular24(context),
                ),
                const SizedBox(height: 16.0),
                CustomTextField(
                  textEditingController: _fromController,
                  hint: 'From',
                ),
                const SizedBox(height: 10.0),
                CustomTextField(
                  textEditingController: _toController,
                  hint: 'To',
                ),
                const SizedBox(height: 10.0),
                CustomTextField(
                  textEditingController: _dayController,
                  hint: 'Day',
                ),
                const SizedBox(height: 10.0),
                AssignedToDropdown(
                  onSelected: (id) {
                    setState(() {
                      _selectedEmployeeId = id;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                CustomButton(
                  buttonText: 'Add Shift',
                  onPressed: () {
                    _submitShift(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitShift(BuildContext context) {
    final cubit = BlocProvider.of<CreateShiftCubit>(context);
    if (_fromController.text.isNotEmpty &&
        _toController.text.isNotEmpty &&
        _dayController.text.isNotEmpty &&
        _selectedEmployeeId != null) {
      cubit.createShift(
        from: _fromController.text,
        to: _toController.text,
        day: _dayController.text,
        id: _selectedEmployeeId!,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
    }
  }
}
