import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthy_guide/modules/nut_facts/fact_display.dart';
import 'package:healthy_guide/shared/component.dart/component.dart';
import 'package:healthy_guide/shared/cubit/cubit.dart';
import 'package:healthy_guide/shared/cubit/state.dart';
import 'package:healthy_guide/shared/manager/color_manager.dart';
import 'package:healthy_guide/shared/manager/font_manager.dart';
import 'package:healthy_guide/shared/manager/styles_manager.dart';

class nutrition_facts_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<healthy_guide_cubit, healthy_guide_State>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.grey, Colors.blueGrey],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: SafeArea(
                  child: Column(
                    children: [
                      InkWell(
                        child: SizedBox(
                          height: 450.h,
                          child: Padding(
                            padding: EdgeInsets.only(left: 32.0.w),
                            child: Swiper(
                              itemCount: healthy_guide_cubit
                                  .get(context)
                                  .nutrationfacts
                                  .length,
                              fade: 0.3,
                              itemWidth:
                                  MediaQuery.of(context).size.width - 2 * 64,
                              layout: SwiperLayout.STACK,
                              pagination: SwiperPagination(
                                  builder: DotSwiperPaginationBuilder(
                                      activeSize: 20,
                                      activeColor: ColorManager.primary,
                                      space: 5)),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    navigateTo(
                                        context,
                                        facts_display(
                                          models: healthy_guide_cubit
                                              .get(context)
                                              .nutrationfacts[index]
                                              .facts,
                                          title: healthy_guide_cubit
                                              .get(context)
                                              .nutrationfacts[index]
                                              .name,
                                        ));
                                  },
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          SizedBox(
                                            height: 100.h,
                                          ),
                                          Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32)),
                                            elevation: 8,
                                            color: ColorManager.white,
                                            child: Padding(
                                              padding: EdgeInsets.all(32.0.w),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 80.h,
                                                  ),
                                                  Text(
                                                    healthy_guide_cubit
                                                        .get(context)
                                                        .nutrationfacts[index]
                                                        .name
                                                        .toString(),
                                                    style: getBoldStyle(
                                                        color:
                                                            ColorManager.black,
                                                        fontSize: FontSize.s26),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 32.0.w),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Know more",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  FontSize.s16,
                                                              fontFamily:
                                                                  'Avenir',
                                                              color:
                                                                  ColorManager
                                                                      .error,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                          textAlign:
                                                              TextAlign.left,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .arrow_forward_rounded,
                                                          color: ColorManager
                                                              .error,
                                                          size: 18,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      CircleAvatar(
                                        radius: 100.0,
                                        backgroundImage: AssetImage(
                                          healthy_guide_cubit
                                              .get(context)
                                              .nutrationfacts[index]
                                              .images!,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
