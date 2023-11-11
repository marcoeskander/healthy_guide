import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthy_guide/models/diets_Models.dart';
import 'package:healthy_guide/modules/home/instructionsDisplay.dart';
import 'package:healthy_guide/shared/manager/color_manager.dart';
import 'package:healthy_guide/shared/manager/font_manager.dart';
import 'package:healthy_guide/shared/manager/styles_manager.dart';

Widget button_ForInstruction_Page(
        {String? buttontext,
        String? buttonImage,
        diets_Models? dietsData,
        context}) =>
    Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: InkWell(
        onTap: () {
          navigateTo(
            context,
            instructions_Display(
              dietsData: dietsData,
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.primary,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(40.r),
              right: Radius.circular(40.r),
            ),
          ),
          height: 100.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.arrow_back_ios_new,
                color: ColorManager.black,
              ),
              SizedBox(
                width: 10.0.w,
              ),
              Text(
                buttontext!,
                style: getSemiBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.s16),
              ),
              SizedBox(
                width: 15.0.w,
              ),
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage(
                  buttonImage!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget navigateBack(context) => IconButton(
    onPressed: () {
      Navigator.pop(context);
    },
    icon: const Icon(Icons.arrow_back_ios_outlined));
void navigatAndFinsh(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );
Widget buidHeadinfo({
  required String tsxtTitle,
  required String photoTitle,
  context,
  required bool back,
}) =>
    Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Container(
            height: 250.0.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(photoTitle),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0.r),
                  bottomRight: Radius.circular(50.0.r),
                )),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                tsxtTitle,
                style: TextStyle(
                    backgroundColor: ColorManager.black.withOpacity(0.2),
                    color: ColorManager.white,
                    fontWeight: FontWeight.bold,
                    fontSize: FontSize.s30),
              ),
            ),
          ),
        ),
        if (back == true)
          Positioned(
            top: 30,
            left: 10,
            child: navigateBack(context),
          ),
      ],
    );
