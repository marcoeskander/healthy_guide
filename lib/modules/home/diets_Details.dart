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

// ignore: camel_case_types, must_be_immutable
class diets_Details extends StatelessWidget {
  diets_Models model;
  diets_Details({super.key, required this.model});
  Widget prengant({required String text, context, required int index}) =>
      Expanded(
        child: InkWell(
          onTap: () {
            if (index == 0) {
              healthy_guide_cubit.get(context).Changeitem(0);
            } else if (index == 1) {
              healthy_guide_cubit.get(context).Changeitem(1);
            } else {
              healthy_guide_cubit.get(context).Changeitem(2);
            }
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(50),
                right: Radius.circular(50),
              ),
            ),
            height: 30,
            width: 30,
            child: Text(
              text,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<healthy_guide_cubit, healthy_guide_State>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 200.h,
                    ),
                    Text(
                      model.Diets_Name!,
                      style: getBoldStyle(
                        color: Colors.black,
                        fontSize: 40,
                      ),
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.ltr,
                    ),
                    if (model.Id! < 1200 && model.Id != 5 && model.Id != 3)
                      button_ForInstruction_Page(
                        buttontext: model.Diets_Name,
                        buttonImage: model.dieits_Image,
                        dietsData: model,
                        context: context,
                      ),
                    if (model.Id! == 1)
                      Padding(
                        padding: EdgeInsets.all(10.0.w),
                        child: Row(
                          children: [
                            prengant(
                                text: 'اول 3 اشهر', context: context, index: 0),
                            SizedBox(
                              width: 5.w,
                            ),
                            prengant(
                                text: 'ثانى 3 اشهر',
                                context: context,
                                index: 1),
                            SizedBox(
                              width: 5.w,
                            ),
                            prengant(
                                text: 'ثالث 3 اشهر',
                                context: context,
                                index: 2),
                          ],
                        ),
                      ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(
                      color: Colors.black87,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Text(
                                model.Diets_description![
                                    healthy_guide_cubit.get(context).i],
                                style: getSemiBoldStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s18),
                                textDirection: TextDirection.rtl,
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                Positioned(
                  top: 10,
                  right: -10.0,
                  child: Hero(
                    tag: model.Id!,
                    child: Material(
                      color: ColorManager.black.withOpacity(0.2),
                      child: InkWell(
                        child: CircleAvatar(
                          radius: 80.0.r,
                          backgroundImage: AssetImage(
                            model.dieits_Image!,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 10,
                  child: navigateBack(context),
                ),
                if (model.Id! >= 1200)
                  Positioned(
                    top: 50,
                    left: 10,
                    child: Text(
                      '${model.Id!}',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 80,
                          color: ColorManager.grey1),
                    ),
                  ),
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}
