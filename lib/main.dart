import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legends_management/core/routes/app_router.dart';
import 'package:legends_management/feature/admin/department/presentation/viewmodel/ratingcubit/rating_cubit.dart';

import 'core/network/local/cache_helper.dart';
import 'core/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  runApp(MultiBlocProvider(
    providers: [
    BlocProvider(
      create: (context) => RatingCubit(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // minTextAdapt: true,
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
