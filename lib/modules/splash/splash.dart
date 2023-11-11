import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthy_guide/layouts/HomeLayout.dart';
import 'package:healthy_guide/shared/component.dart/component.dart';
import 'dart:async';

import 'package:healthy_guide/shared/manager/color_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? timer;

  _startDelay() {
    timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() {
    navigatAndFinsh(context, healthy_guide_Layout());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
          child: CircleAvatar(
              backgroundColor: ColorManager.primary,
              radius: 100.0.r,
              child:
                  const Image(image: AssetImage('assets/images/hGuide.png')))),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
