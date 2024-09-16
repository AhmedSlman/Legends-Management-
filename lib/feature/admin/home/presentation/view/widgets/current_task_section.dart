import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrentTasksSection extends StatelessWidget {
  const CurrentTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Padding(
      padding: EdgeInsets.all(8.0.w),
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Row(
            children: [
              Text(
                'Current Tasks',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                'View All',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: Container(
              color: Colors.grey[900],
              child: Scrollbar(
                controller: scrollController,
                trackVisibility: true,
                thumbVisibility: true,
                thickness: 6.w,
                radius: Radius.circular(10.r),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0.h),
                      child: TaskCard(
                        taskName: 'Task${index + 1}',
                        taskDetails: 'Simply dummy text of the printing.',
                        status: index % 2 == 0 ? 'In progress' : 'Pending',
                        progress: index % 2 == 0 ? 0.6 : 0.3,
                        teamImages: List.generate(
                            4, (index) => 'assets/images/user${index + 1}.png'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// TaskCard remains unchanged

class TaskCard extends StatelessWidget {
  final String taskName;
  final String taskDetails;
  final String status;
  final double progress;
  final List<String> teamImages;

  const TaskCard({
    super.key,
    required this.taskName,
    required this.taskDetails,
    required this.status,
    required this.progress,
    required this.teamImages,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
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
                Text(
                  taskName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    color: Colors.orange,
                    size: 24.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),

            //? Task details
            Text(
              'Details: $taskDetails',
              style: TextStyle(color: Colors.grey, fontSize: 14.sp),
            ),
            SizedBox(height: 8.h),

            //? Task status
            Row(
              children: [
                Text(
                  'Status:',
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
                SizedBox(width: 8.w),
                Text(
                  status,
                  style: TextStyle(
                    color: status == 'In progress' ? Colors.orange : Colors.red,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),

            //? Progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.white,
                color: Colors.green,
                minHeight: 8.h,
              ),
            ),
            SizedBox(height: 16.h),

            //? Team section
            Row(
              children: [
                Text(
                  'Team:',
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
                SizedBox(width: 8.w),
                ...teamImages.map((image) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(image),
                      radius: 15.r,
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
