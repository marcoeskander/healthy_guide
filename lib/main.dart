import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_guide/modules/splash/splash.dart';
import 'package:healthy_guide/shared/cubit/cubit.dart';
import 'package:healthy_guide/shared/cubit/state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => healthy_guide_cubit()..readJson(),
        child: BlocConsumer<healthy_guide_cubit, healthy_guide_State>(
            listener: (context, state) {},
            builder: (context, state) {
              return const ScreenUtilInit(
                designSize: Size(360, 690),
                minTextAdapt: true,
                splitScreenMode: true,
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  home: SplashView(),
                ),
              );
            }));
  }
}
