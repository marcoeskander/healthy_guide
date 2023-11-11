import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthy_guide/models/diets_Models.dart';
import 'package:healthy_guide/shared/component.dart/component.dart';
import 'package:healthy_guide/shared/cubit/cubit.dart';
import 'package:healthy_guide/shared/cubit/state.dart';
import 'package:healthy_guide/shared/manager/color_manager.dart';
import 'package:healthy_guide/shared/manager/font_manager.dart';
import 'package:healthy_guide/shared/manager/styles_manager.dart';

// ignore: must_be_immutable, camel_case_types
class instructions_Display extends StatelessWidget {
  diets_Models? dietsData;

  instructions_Display({
    super.key,
    this.dietsData,
  });
  @override
  Widget build(Object context) {
    return BlocConsumer<healthy_guide_cubit, healthy_guide_State>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  buidHeadinfo(
                      tsxtTitle: dietsData!.Diets_Name!,
                      photoTitle: dietsData!.dieits_Image!,
                      context: context,
                      back: true),
                  SizedBox(
                    height: 10.h,
                  ),
                  Column(
                    children: [
                      Text(
                        dietsData!.Id! == 1
                            ? dietsData!.Diets_description![3]
                            : dietsData!.Diets_description![1],
                        style: getBoldStyle(
                            color: ColorManager.black, fontSize: FontSize.s18),
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        textWidthBasis: TextWidthBasis.longestLine,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
