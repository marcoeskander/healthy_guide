import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_guide/models/diets_Models.dart';
import 'package:healthy_guide/models/food_model.dart';
import 'package:healthy_guide/modules/home/Home.dart';
import 'package:healthy_guide/modules/nut_facts/nutrition_Facts.dart';
import 'package:healthy_guide/modules/tranning/training.dart';
import 'package:healthy_guide/modules/yourneed/your_need.dart';
import 'package:healthy_guide/shared/cubit/state.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:healthy_guide/shared/manager/String_manager.dart';
import 'package:healthy_guide/shared/manager/color_manager.dart';
import 'package:healthy_guide/shared/manager/font_manager.dart';
import 'package:healthy_guide/shared/manager/styles_manager.dart';

class healthy_guide_cubit extends Cubit<healthy_guide_State> {
  healthy_guide_cubit() : super(init_healthy_guide_State());

  static healthy_guide_cubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> buildScreens = [
    home_Screen(),
    training_Display(),
    nutrition_facts_Screen(),
    calculators(),
  ];

  Widget HG_BottomBarBubble() => BottomBarDoubleBullet(
        color: ColorManager.darkGreyss,
        selectedIndex: currentIndex,
        items: [
          BottomBarItem(
            iconData: Icons.home,
            label: "Home",
            labelTextStyle: getMediumStyle(
                color: ColorManager.grey1, fontSize: FontSize.s16),
          ),
          BottomBarItem(
            iconData: Icons.fitness_center,
            label: "trining",
            labelTextStyle: getMediumStyle(
                color: ColorManager.grey1, fontSize: FontSize.s16),
          ),
          BottomBarItem(
            iconData: Icons.add_task,
            label: "facts",
            labelTextStyle: getMediumStyle(
                color: ColorManager.grey1, fontSize: FontSize.s16),
          ),
          BottomBarItem(
            iconData: Icons.add_reaction,
            label: "your need",
            labelTextStyle: getMediumStyle(
                color: ColorManager.grey1, fontSize: FontSize.s16),
          ),
        ],
        onSelect: (index) {
          ChangeScreen(index);
        },
      );
  void ChangeScreen(index) {
    currentIndex = index;
    emit(changeScreen_healthy_guide_State());
  }

  diets_Models instructionmodel = diets_Models(
      Id: 120000,
      Diets_Name: 'ارشادات لتباع النظام الغذائى',
      dieits_Image: 'assets/images/adv1.jpg',
      Diets_description: [
        String_manager.diets_instructions,
        String_manager.diets_instructions,
      ]);
  List<String> dietTitle = [];
  List<diets_Models> Diets_Data = [
    diets_Models(
        Id: 1200,
        Diets_Name: 'نظام 1200 سعره حرارى',
        dieits_Image: 'assets/images/1200.png',
        Diets_description: [
          String_manager.diets_1200_cals,
        ]),
    diets_Models(
        Id: 1400,
        Diets_Name: 'نظام 1400 سعره حرارى',
        dieits_Image: 'assets/images/1400.png',
        Diets_description: [
          String_manager.diets_1400_cals,
        ]),
    diets_Models(
        Id: 1600,
        Diets_Name: 'نظام 1600 سعره حرارى',
        dieits_Image: 'assets/images/1600.png',
        Diets_description: [
          String_manager.diets_1600_cals,
        ]),
    diets_Models(
        Id: 1800,
        Diets_Name: 'نظام 1800 سعره حرارى',
        dieits_Image: 'assets/images/1800.png',
        Diets_description: [
          String_manager.diets_1800_cals,
        ]),
    diets_Models(
        Id: 2000,
        Diets_Name: 'نظام 2000 سعره حرارى',
        dieits_Image: 'assets/images/2000.png',
        Diets_description: [
          String_manager.diets_2000_cals,
        ]),
    diets_Models(
        Id: 2200,
        Diets_Name: 'نظام 2200 سعره حرارى',
        dieits_Image: 'assets/images/2200.png',
        Diets_description: [
          String_manager.diets_2200_cals,
        ]),
    diets_Models(
        Id: 1,
        Diets_Name: 'نظام للحوامل ',
        dieits_Image: 'assets/images/pregnant.jpg',
        Diets_description: [
          String_manager.diets_pregnant_f3,
          String_manager.diets_pregnant_s3,
          String_manager.diets_pregnant_t3,
          String_manager.diets_pregnant_advice,
        ]),
    diets_Models(
        Id: 2,
        Diets_Name: 'نظام للمرضعات ',
        dieits_Image: 'assets/images/Breastf.jpg',
        Diets_description: [
          String_manager.diets_Breastfeeding,
          String_manager.diets_Breastfeeding_advice,
        ]),
    diets_Models(
        Id: 3,
        Diets_Name: 'نظام للاطفال ',
        dieits_Image: 'assets/images/fatChildren.jpg',
        Diets_description: [
          String_manager.diets_children,
        ]),
    diets_Models(
        Id: 4,
        Diets_Name: 'نظام للنحافه ',
        dieits_Image: 'assets/images/thin.jpg',
        Diets_description: [
          String_manager.diets_Thin,
          String_manager.diets_Thin_advice,
        ]),
    diets_Models(
        Id: 5,
        Diets_Name: ' نظام لتثبيت الوزن ',
        dieits_Image: 'assets/images/wconst.jpg',
        Diets_description: [
          String_manager.weight_pi,
        ]),
  ];
  int i = 0;
  void Changeitem(index) {
    i = index;
    emit(changeitem_healthy_guide_State());
  }

  List<foodData> milks = [];
  List<foodData> eggs = [];
  List<foodData> meets = [];
  List<foodData> fruits = [];
  List<foodData> cream = [];
  List<foodData> nuts = [];
  List<foodData> drinks = [];
  List<foodData> breads = [];
  List<foodData> vegetables = [];
  List<foodData> oils = [];
  List<foodData> fastFood = [];
  List<foodData> spices = [];
  List<foodData> other = [];
  List<nutfactdetails> nutrationfacts = [];
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/file/nutfat.json');
    final data = await json.decode(response);
    await data.forEach((element) {
      if (element['اسم المجموعه'] == 'الحليب ومنتجاته') {
        milks.add(foodData.fromjson(element));
      } else if (element['اسم المجموعه'] == 'البيض') {
        eggs.add(foodData.fromjson(element));
      } else if (element['اسم المجموعه'] == 'اللحوم') {
        meets.add(foodData.fromjson(element));
      } else if (element['اسم المجموعه'] == 'الفواكه') {
        fruits.add(foodData.fromjson(element));
      } else if (element['اسم المجموعه'] == 'الكريمات') {
        cream.add(foodData.fromjson(element));
      } else if (element['اسم المجموعه'] == 'مكسرات') {
        nuts.add(foodData.fromjson(element));
      } else if (element['اسم المجموعه'] == 'المشروبات') {
        drinks.add(foodData.fromjson(element));
      } else if (element['اسم المجموعه'] == 'الخبز والحبوب') {
        breads.add(foodData.fromjson(element));
      } else if (element['اسم المجموعه'] == 'الخضروات') {
        vegetables.add(foodData.fromjson(element));
      } else if (element['اسم المجموعه'] == 'الدهون') {
        oils.add(foodData.fromjson(element));
      } else if (element['اسم المجموعه'] == 'وجبات خفيفة') {
        fastFood.add(foodData.fromjson(element));
      } else if (element['اسم المجموعه'] == "الاعشاب والتوابل") {
        spices.add(foodData.fromjson(element));
      } else {
        other.add(foodData.fromjson(element));
      }
    });
    nutrationfacts = [
      nutfactdetails(
          name: 'الحليب ومنتجاته',
          images: 'assets/images/milk.jpg',
          facts: milks),
      nutfactdetails(
          name: 'البيض', images: 'assets/images/eggs.jpg', facts: eggs),
      nutfactdetails(
          name: 'اللحوم', images: 'assets/images/meets.PNG', facts: meets),
      nutfactdetails(
          name: 'الفواكه', images: 'assets/images/fruits.jpg', facts: fruits),
      nutfactdetails(
          name: 'الكريمات', images: 'assets/images/krama.jpg', facts: cream),
      nutfactdetails(
          name: 'مكسرات', images: 'assets/images/nuts.jpg', facts: nuts),
      nutfactdetails(
          name: 'المشروبات', images: 'assets/images/drinks.jpg', facts: drinks),
      nutfactdetails(
          name: 'الخبز والحبوب',
          images: 'assets/images/bread.jpg',
          facts: breads),
      nutfactdetails(
          name: 'الخضروات',
          images: 'assets/images/vegt.jpg',
          facts: vegetables),
      nutfactdetails(
          name: 'الدهون', images: 'assets/images/fats.jpg', facts: oils),
      nutfactdetails(
          name: 'وجبات خفيفة',
          images: 'assets/images/fastfodd.jpg',
          facts: fastFood),
      nutfactdetails(
          name: "الاعشاب والتوابل",
          images: 'assets/images/tawabel.jpg',
          facts: spices),
      nutfactdetails(
          name: 'الأكلات الشعبية',
          images: 'assets/images/shaby.jpg',
          facts: other),
    ];
    emit(readjsonData_healthy_guide_State());

    print(data[1]);
  }

  bool displayFact = false;
  void change_fact() {
    displayFact = !displayFact;
    emit(displayfact_healthy_guide_State());
  }

  bool ismale = true;
  void changemaledata() {
    ismale = !ismale;
    emit(changedata_healthy_guide_State());
  }

  double height = 120;

  void changeheightdata({required double value}) {
    height = value;
    emit(changeheightdata_healthy_guide_State());
  }

  int weight = 50;
  void changeweightdata({required int value}) {
    weight += value;
    emit(changeweightdata_healthy_guide_State());
  }

  int age = 18;
  void changeagedata({required int value}) {
    age += value;
    emit(changeagedata_healthy_guide_State());
  }

  String dropdownValue = 'Sedentary';
  void changedropdownValue({required String value}) {
    dropdownValue = value;
    emit(changedropDownvaluedata_healthy_guide_State());
  }

  var bmi_result = 0.0;

  var bmr_result = 0.0;
  var perfectW_result = 0.0;
  var fatprecentage_result = 0.0;
  List<String> bmirangedata = [
    'BMI',
    '<18.5',
    '18.5 - 24.9',
    '25 - 29.9',
    '30 - 34.9',
    '35 - 39.9',
    '40 >',
  ];

  List<String> bmidata = [
    'Classification',
    'Underweight',
    'Healthy Weight',
    'Overweight',
    'Class I Obese',
    'Class II Obese',
    'Class III Obese',
  ];
  List<String> bmr_rangedata = [];

  List<String> bmrdata = [
    'Sedentary',
    'Lightly Active',
    'Moderately Active',
    'Very Active',
    'Extremely Active'
  ];
  var level = '';
  void calculate() {
    bmi_result = weight / pow(height / 100, 2);

    bmr_result = (10 * weight) +
        (6.25 * height) -
        (5 * age) +
        (ismale == true ? 5 : -161);
    bmr_rangedata = [
      '${(bmr_result * 1.200).round()}',
      '${(bmr_result * 1.375).round()}',
      '${(bmr_result * 1.550).round()}',
      '${(bmr_result * 1.725).round()}',
      '${(bmr_result * 1.900).round()}',
    ];
    if (dropdownValue == 'Sedentary') {
      level = bmr_rangedata[0];
    } else if (dropdownValue == 'Lightly Active') {
      level = bmr_rangedata[1];
    } else if (dropdownValue == 'Moderately Active') {
      level = bmr_rangedata[2];
    } else if (dropdownValue == 'Very Active') {
      level = bmr_rangedata[3];
    } else {
      level = bmr_rangedata[4];
    }
    perfectW_result = ((ismale == true ? 48 : 45) +
        ((ismale == true ? 1.1 : 0.9) * (height - 150)));
    fatprecentage_result =
        ((1.20 * bmi_result) + (0.23 * age) - (ismale == true ? 5.4 : 16.2)) /
            100;
  }
}
