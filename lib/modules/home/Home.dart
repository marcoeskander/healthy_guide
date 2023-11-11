import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthy_guide/models/diets_Models.dart';
import 'package:healthy_guide/modules/home/diets_Details.dart';
import 'package:healthy_guide/shared/component.dart/component.dart';
import 'package:healthy_guide/shared/cubit/cubit.dart';
import 'package:healthy_guide/shared/cubit/state.dart';

class home_Screen extends StatelessWidget {
  const home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = healthy_guide_cubit.get(context);
    return BlocConsumer<healthy_guide_cubit, healthy_guide_State>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40.h,
              ),
              button_ForInstruction_Page(
                buttontext: cubit.instructionmodel.Diets_Name,
                buttonImage: cubit.instructionmodel.dieits_Image,
                dietsData: cubit.instructionmodel,
                context: context,
              ),
              SizedBox(
                height: 10.h,
              ),
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 0.2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(
                  cubit.Diets_Data.length,
                  (index) => diets_item(
                    context: context,
                    model: cubit.Diets_Data[index],
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

Widget diets_item({
  context,
  diets_Models? model,
}) =>
    Column(children: [
      SizedBox(
        width: 120.w,
        child: Hero(
          tag: model!.Id!,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (context, a, b) => diets_Details(
                        model: model,
                      ),
                      transitionsBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ));
              },
              child: CircleAvatar(
                radius: 70.0.r,
                backgroundImage: AssetImage(
                  model.dieits_Image!,
                ),
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 5.h,
      ),
      Text(
        model.Diets_Name!,
      ),
    ]);
