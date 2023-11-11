import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_guide/shared/cubit/cubit.dart';
import 'package:healthy_guide/shared/cubit/state.dart';

class healthy_guide_Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<healthy_guide_cubit, healthy_guide_State>(
      listener: (context, state) {},
      builder: (context, state) {
        var HG_Cubit = healthy_guide_cubit.get(context);
        return Scaffold(
          bottomNavigationBar: HG_Cubit.HG_BottomBarBubble(),
          body: HG_Cubit.buildScreens[HG_Cubit.currentIndex],
        );
      },
    );
  }
}
