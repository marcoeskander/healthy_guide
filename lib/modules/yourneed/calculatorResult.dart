import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthy_guide/shared/cubit/cubit.dart';
import 'package:healthy_guide/shared/cubit/state.dart';
import 'package:healthy_guide/shared/manager/color_manager.dart';
import 'package:healthy_guide/shared/manager/font_manager.dart';
import 'package:healthy_guide/shared/manager/styles_manager.dart';

class calculatorResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<healthy_guide_cubit, healthy_guide_State>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = healthy_guide_cubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  columnitem(
                      text: 'Your BMI',
                      result: '${cubit.bmi_result.round()} kg/m2'),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => rowitem(
                        text: cubit.bmirangedata[index],
                        range: cubit.bmidata[index]),
                    itemCount: 5,
                  ),
                  columnitem(
                      text: 'Total Basal Metabolic Rate (BMR)',
                      result: '${cubit.bmr_result.round()} Calories/Day'),
                  columnitem(
                      text: 'Daily Calorie Needs',
                      result: '${cubit.level} kcal'),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => rowitem(
                        text: cubit.bmrdata[index],
                        range: cubit.bmr_rangedata[index]),
                    itemCount: 5,
                  ),
                  columnitem(
                      text: 'Your fat percentage',
                      result: '${cubit.fatprecentage_result.round()} %'),
                  columnitem(
                      text: 'Your perfect weight',
                      result: '${cubit.perfectW_result.round()} kg'),
                ],
              ),
            ),
          );
        });
  }
}

Widget rowitem({
  required String text,
  required String range,
}) =>
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
      child: Container(
        height: 60.h,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: ColorManager.bluegray),
            borderRadius: BorderRadius.circular(20.0.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              range,
              textAlign: TextAlign.left,
            ),
            SizedBox(
              width: 40.w,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
Widget columnitem({
  required String text,
  required String result,
}) =>
    Padding(
      padding: EdgeInsets.all(20.0.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: getBoldStyle(
                color: ColorManager.lightblue, fontSize: FontSize.s24),
          ),
          SizedBox(
            width: 40.r,
          ),
          Text(
            result,
            style:
                getBoldStyle(color: ColorManager.black, fontSize: FontSize.s20),
          ),
        ],
      ),
    );
