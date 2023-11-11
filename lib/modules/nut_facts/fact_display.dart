import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthy_guide/models/food_model.dart';
import 'package:healthy_guide/shared/cubit/cubit.dart';
import 'package:healthy_guide/shared/cubit/state.dart';
import 'package:healthy_guide/shared/manager/color_manager.dart';
import 'package:healthy_guide/shared/manager/font_manager.dart';
import 'package:healthy_guide/shared/manager/styles_manager.dart';

class facts_display extends StatelessWidget {
  List<foodData>? models;
  String? title;
  facts_display({this.models, this.title});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<healthy_guide_cubit, healthy_guide_State>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              title!,
              style: getBoldStyle(
                  color: ColorManager.black, fontSize: FontSize.s20),
              textAlign: TextAlign.right,
            ),
          ),
          body: SafeArea(
            child: Container(
              child: ListView.separated(
                  itemBuilder: (context, index) =>
                      buildFactsitems(model: models![index], context: context),
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1.2.h,
                      color: ColorManager.black,
                    );
                  },
                  itemCount: models!.length),
            ),
          ),
        );
      },
    );
  }
}

Widget buildFactsitems({required foodData model, context}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 5.0.w),
    child: Container(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            IconButton(
                onPressed: () {
                  healthy_guide_cubit.get(context).change_fact();
                },
                icon: Icon(Icons.arrow_circle_down)),
            SizedBox(
              width: 5.0.w,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        dataText(
                          text: 'سعرات حرارية',
                        ),
                        Text(model.calories!),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5.0.w,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        dataText(
                          text: 'الوزن',
                        ),
                        Text(model.weight!),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5.0.w,
            ),
            Expanded(
              child: Text(
                model.name!,
                style: getBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.s12),
                textAlign: TextAlign.right,
              ),
            ),
          ]),
          if (healthy_guide_cubit.get(context).displayFact)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      dataText(
                        text: 'بروتين',
                      ),
                      Text(model.protein!),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8.0.w,
                ),
                Expanded(
                  child: Column(
                    children: [
                      dataText(
                        text: 'دهون',
                      ),
                      Text(model.fats!),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8.0.w,
                ),
                Expanded(
                  child: Column(
                    children: [
                      dataText(
                        text: 'كربوهيدرات',
                      ),
                      Text(model.carbohydrate!),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8.0.w,
                ),
                Expanded(
                  child: Column(
                    children: [
                      dataText(
                        text: 'سكر',
                      ),
                      Text('${model.sugars != null ? model.sugars : '0'}'),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    ),
  );
}

Widget dataText({required String text}) => Text(
      text,
      style: getMediumStyle(color: ColorManager.black, fontSize: FontSize.s12),
      textDirection: TextDirection.rtl,
    );
