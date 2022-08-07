import 'package:flutter/material.dart';
import 'package:flutter_next_level/product/global/theme_notifer.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter_next_level/product/constant/duration_items.dart';
import 'package:flutter_next_level/product/constant/lottie_items.dart';
import 'package:provider/provider.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({Key? key}) : super(key: key);

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}
//https://assets8.lottiefiles.com/packages/lf20_ydo1amjm.json
class _LottieLearnState extends State<LottieLearn> with TickerProviderStateMixin {

  late AnimationController controller;
  bool isLight=false;
  @override
  void initState() {
    super.initState();
    controller=AnimationController(vsync:this,duration: DurationItems.durationNormal());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [InkWell(
          onTap:() async {
           await controller.animateTo(isLight?0.5:1) ;
            context.read<ThemeNotifer>().changeTheme();

            isLight=!isLight;
          },
          child: LottieBuilder.asset(LottieItems.themeChange.lottiePath,
          repeat: false,
          controller: controller,
          ))],
      ),
      body: const LoadingLottie(),
    );
  }
}

class LoadingLottie extends StatelessWidget {
    final _loadingLottie='https://assets6.lottiefiles.com/datafiles/bEYvzB8QfV3EM9a/data.json';

  const LoadingLottie({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.network(_loadingLottie));
  }
}