import 'dart:ui';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif_view/gif_view.dart';
import 'package:healthy_guide/models/trainning_model.dart';
import 'package:healthy_guide/shared/component.dart/component.dart';
import 'package:healthy_guide/shared/cubit/cubit.dart';
import 'package:healthy_guide/shared/cubit/state.dart';
import 'package:healthy_guide/shared/manager/color_manager.dart';
import 'package:healthy_guide/shared/manager/font_manager.dart';
import 'package:healthy_guide/shared/manager/styles_manager.dart';

// ignore: must_be_immutable, camel_case_types
class training_Display extends StatelessWidget {
  @override
  Widget build(Object context) {
    List<exercise_model> bodytrainning = exercise_model.fullBody;
    return BlocConsumer<healthy_guide_cubit, healthy_guide_State>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      buidHeadinfo(
                          tsxtTitle: bodytrainning[index].exercise_hedTitle!,
                          photoTitle: bodytrainning[index].exercise_hedphoto!,
                          context: context,
                          back: false),
                      SizedBox(
                        height: 10.h,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, i) => Column(
                                children: [
                                  GifView(
                                      frameRate: 2,
                                      image: AssetImage(bodytrainning[index]
                                          .exercise_photo![i])),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    bodytrainning[index].exercise_Title![i],
                                    style: getBoldStyle(
                                        color: ColorManager.darkGreyss,
                                        fontSize: FontSize.s20),
                                  ),
                                  Container(
                                    width: 130.w,
                                    height: 2.2,
                                    color: ColorManager.primary,
                                  )
                                ],
                              ),
                          separatorBuilder: (context, index) => Container(
                                height: 5.2.h,
                              ),
                          itemCount:
                              bodytrainning[index].exercise_photo!.length)
                    ],
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: bodytrainning.length,
              viewportFraction: 0.7,
              scale: 0.9,
            ),
          );
        });
  }
}
