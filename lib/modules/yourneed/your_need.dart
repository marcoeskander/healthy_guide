import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthy_guide/shared/cubit/cubit.dart';
import 'package:healthy_guide/shared/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:healthy_guide/modules/yourneed/calculatorResult.dart';
import 'package:healthy_guide/shared/component.dart/component.dart';
import 'package:healthy_guide/shared/manager/color_manager.dart';
import 'package:healthy_guide/shared/manager/font_manager.dart';
import 'package:healthy_guide/shared/manager/styles_manager.dart';

class calculators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<healthy_guide_cubit, healthy_guide_State>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = healthy_guide_cubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              ' calculator',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            cubit.changemaledata();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0.r),
                              color: cubit.ismale
                                  ? ColorManager.primary
                                  : ColorManager.grey1,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: const AssetImage(
                                    'assets/images/boy.png',
                                  ),
                                  width: 85.0.w,
                                  height: 85.0.h,
                                ),
                                SizedBox(
                                  height: 10.0.h,
                                ),
                                Text(
                                  'male',
                                  style: getBoldStyle(
                                    fontSize: FontSize.s22,
                                    color: ColorManager.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0.w,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            cubit.changemaledata();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0.r),
                              color: !cubit.ismale
                                  ? ColorManager.primary
                                  : ColorManager.grey1,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: const AssetImage(
                                    'assets/images/girl.png',
                                  ),
                                  width: 85.0.w,
                                  height: 85.0.h,
                                ),
                                SizedBox(
                                  height: 10.0.h,
                                ),
                                Text(
                                  'female',
                                  style: getBoldStyle(
                                      fontSize: FontSize.s22,
                                      color: ColorManager.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0.r),
                      color: ColorManager.grey1,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'height',
                          style: getBoldStyle(
                              fontSize: FontSize.s30,
                              color: ColorManager.black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '${cubit.height.round()}',
                              style: getSemiBoldStyle(
                                  fontSize: FontSize.s40,
                                  color: ColorManager.black),
                            ),
                            const SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              'cm',
                              style: getSemiBoldStyle(
                                  fontSize: FontSize.s40,
                                  color: ColorManager.black),
                            ),
                          ],
                        ),
                        Slider(
                            activeColor: ColorManager.primary,
                            inactiveColor: ColorManager.darkGreyss,
                            value: cubit.height,
                            max: 220,
                            min: 80,
                            onChanged: (Value) {
                              cubit.changeheightdata(value: Value);
                              print(Value.round());
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(
                    20.0.w,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0.r),
                            color: ColorManager.grey1,
                          ),
                          child: Column(
                            children: [
                              Text(
                                'weight',
                                style: getBoldStyle(
                                    fontSize: FontSize.s30,
                                    color: ColorManager.black),
                              ),
                              Text(
                                '${cubit.weight}',
                                style: getSemiBoldStyle(
                                    fontSize: FontSize.s30,
                                    color: ColorManager.black),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: ColorManager.primary,
                                    heroTag: 'weight-',
                                    onPressed: () {
                                      cubit.changeweightdata(value: -1);
                                    },
                                    mini: true,
                                    child: const Icon(
                                      Icons.remove,
                                    ),
                                  ),
                                  FloatingActionButton(
                                    backgroundColor: ColorManager.primary,
                                    heroTag: 'weight+',
                                    onPressed: () {
                                      cubit.changeweightdata(value: 1);
                                    },
                                    mini: true,
                                    child: const Icon(
                                      Icons.add,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0.r),
                            color: ColorManager.grey1,
                          ),
                          child: Column(
                            children: [
                              Text(
                                'age',
                                style: getBoldStyle(
                                    fontSize: FontSize.s30,
                                    color: ColorManager.black),
                              ),
                              Text(
                                '${cubit.age}',
                                style: getSemiBoldStyle(
                                    fontSize: FontSize.s30,
                                    color: ColorManager.black),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: ColorManager.primary,
                                    heroTag: 'age-',
                                    onPressed: () {
                                      cubit.changeagedata(value: -1);
                                    },
                                    mini: true,
                                    child: const Icon(
                                      Icons.remove,
                                    ),
                                  ),
                                  FloatingActionButton(
                                    backgroundColor: ColorManager.primary,
                                    heroTag: 'age+',
                                    onPressed: () {
                                      cubit.changeagedata(value: 1);
                                    },
                                    mini: true,
                                    child: const Icon(
                                      Icons.add,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.0.w,
                  ),
                  Expanded(
                    child: Text(
                      'Activity Level',
                      style: getBoldStyle(
                          color: ColorManager.black, fontSize: FontSize.s16),
                    ),
                  ),
                  SizedBox(
                    width: 20.0.w,
                  ),
                  Expanded(
                    child: DropdownButton(
                        items: [
                          DropdownMenuItem(
                            value: 'Sedentary',
                            child: Text(
                              'Sedentary',
                              style: getBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.s16),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Lightly Active',
                            child: Text(
                              'Lightly Active',
                              style: getBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.s16),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Moderately Active',
                            child: Text(
                              'Moderately Active',
                              style: getBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.s16),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Very Active',
                            child: Text(
                              'Very Active',
                              style: getBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.s16),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Extermely Active',
                            child: Text(
                              'Extermely Active',
                              style: getBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.s16),
                            ),
                          ),
                        ],
                        value: cubit.dropdownValue,
                        onChanged: (value) {
                          cubit.changedropdownValue(value: value!);
                        }),
                  ),
                ],
              ),
              Container(
                height: 50.0,
                width: double.infinity,
                color: ColorManager.primary,
                child: MaterialButton(
                  onPressed: () {
                    cubit.calculate();
                    navigateTo(context, calculatorResult());
                  },
                  child: Text(
                    'calculate',
                    style: getRegularStyle(
                        fontSize: FontSize.s20, color: ColorManager.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
