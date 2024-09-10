import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legends_management/core/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(1440, 1024),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Legends ManageMent',
        routerConfig: AppRouter.router,
      ),
    );
  }
}
