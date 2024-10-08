import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legends_management/core/widgets/custom_button.dart';
import 'package:legends_management/core/widgets/custom_text_field.dart';

import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../home/data/models/all_employees_model.dart';
import '../../../../home/presentation/viewmodel/allemployeescubit/all_employees_cubit.dart';
import '../../viewmodel/createtaskcubit/create_task_cubit.dart';

class CurrentTasksHeader extends StatefulWidget {
  const CurrentTasksHeader({super.key});

  @override
  State<CurrentTasksHeader> createState() => _CurrentTasksHeaderState();
}

class _CurrentTasksHeaderState extends State<CurrentTasksHeader> {
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _taskDescriptionController =
      TextEditingController();
  String? _selectedEmployeeId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Current Tasks',
          style: AppStyles.styleRegular32(context),
        ),
        GestureDetector(
          onTap: () {
            _showTaskFormBottomSheet(context);
          },
          child: SvgPicture.asset(Assets.imagesAddbutton),
        ),
      ],
    );
  }

  void _showTaskFormBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.black,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return BlocProvider<CreateTaskCubit>(
          create: (context) => CreateTaskCubit(),
          child: TaskFormBottomSheet(
            taskNameController: _taskNameController,
            taskDescriptionController: _taskDescriptionController,
            selectedEmployeeId: _selectedEmployeeId, // Pass updated state here
            onSelectedEmployeeId: (id) {
              setState(() {
                _selectedEmployeeId = id; // Ensure parent state is updated
                debugPrint('Parent state updated with ID: $id');
              });
            },
          ),
        );
      },
    );
  }
}

class TaskFormBottomSheet extends StatefulWidget {
  final TextEditingController taskNameController;
  final TextEditingController taskDescriptionController;
  final String? selectedEmployeeId;
  final ValueChanged<String?> onSelectedEmployeeId;

  const TaskFormBottomSheet({
    super.key,
    required this.taskNameController,
    required this.taskDescriptionController,
    required this.selectedEmployeeId,
    required this.onSelectedEmployeeId,
  });

  @override
  State<TaskFormBottomSheet> createState() => _TaskFormBottomSheetState();
}

class _TaskFormBottomSheetState extends State<TaskFormBottomSheet> {
  String? _selectedEmployeeId;

  @override
  void initState() {
    super.initState();
    _selectedEmployeeId = widget.selectedEmployeeId;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 600,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocListener<CreateTaskCubit, CreateTaskState>(
                    listener: (context, state) {
                      if (state is CreateTaskSuccess) {
                        debugPrint(
                            'Task created successfully: ${state.tasksModel}');
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Task successfully created!')),
                        );
                      } else if (state is CreateTaskFailure) {
                        debugPrint('Task creation failed: ${state.errMsg}');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Failed to create task!')),
                        );
                      }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Add New Task',
                          style: AppStyles.styleRegular24(context),
                        ),
                        const SizedBox(height: 16.0),
                        CustomTextField(
                          hint: 'Task Name',
                          textEditingController: widget.taskNameController,
                        ),
                        const SizedBox(height: 10.0),
                        CustomTextField(
                          hint: 'Task Description',
                          textEditingController:
                              widget.taskDescriptionController,
                        ),
                        const SizedBox(height: 10.0),
                        AssignedToDropdown(
                          onSelected: (id) {
                            setState(() {
                              _selectedEmployeeId = id;
                            });
                            widget.onSelectedEmployeeId(id);
                          },
                        ),
                        const SizedBox(height: 20.0),
                        CustomButton(
                          buttonText: 'Add Task',
                          onPressed: () {
                            _submitTask(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitTask(BuildContext context) {
    final cubit = BlocProvider.of<CreateTaskCubit>(context);
    debugPrint('Employer ID during submission: $_selectedEmployeeId');
    if (widget.taskNameController.text.isNotEmpty &&
        widget.taskDescriptionController.text.isNotEmpty &&
        _selectedEmployeeId != null) {
      cubit.createTask(
        name: widget.taskNameController.text,
        id: _selectedEmployeeId!,
        description: widget.taskDescriptionController.text,
      );
    }
  }
}

class AssignedToDropdown extends StatelessWidget {
  final ValueChanged<String?> onSelected;

  const AssignedToDropdown({super.key, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllEmployeesCubit()..fetchAllEmployees(),
      child: BlocBuilder<AllEmployeesCubit, AllEmployeesState>(
        builder: (context, state) {
          if (state is AllEmployeesLoading) {
            return const CircularProgressIndicator();
          } else if (state is AllEmployeesSuccess) {
            List<AllEmplyeesModel> employees = state.allEmployees;
            return _buildAssignedToDropdown(employees);
          } else {
            return const Text('Error loading employees');
          }
        },
      ),
    );
  }

  // Dropdown Button for Assigned To
  Widget _buildAssignedToDropdown(List<AllEmplyeesModel> employees) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        fillColor: Colors.black,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.black),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
      hint: const Text(
        'Assigned To',
        style: TextStyle(color: Color(0xff535353)),
      ),
      items: employees.map((employee) {
        return DropdownMenuItem<String>(
          value: employee.id.toString(),
          child: Text(
            employee.name ?? '',
            style: const TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
      onChanged: (selectedId) {
        // Print the selected ID for debugging
        debugPrint('Selected Employee here 1 ID: $selectedId');
        onSelected(selectedId);
      },
      dropdownColor: Colors.black,
    );
  }
}
