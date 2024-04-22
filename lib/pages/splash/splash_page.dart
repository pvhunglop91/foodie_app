import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_app/pages/welcome_page.dart';

import '../../gen/assets.gen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  //day la doan code de sau 2s no se chuyen sang man hinh homepage
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2000), () {
      Route route = MaterialPageRoute(
        builder: (context) => const WelcomePage(),
      );

      //dung cai pushAndRemoveUntil nay co tac dung tu Splash -> Homepage no se ko back lai ve Splash
      Navigator.pushAndRemoveUntil(
        context,
        route,
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    //lay theo kick thuoc man hinh
    //su dung anh phia duoi theo kich thuoc man hinh
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        // width: double.infinity,
        // height: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.images.backgr.path), fit: BoxFit.fill),
        ),
        child: Image.asset(
          Assets.images.logoFoodie.path,
          width: 160.0,
        ),
      ),

      // body: Stack(
      //   children: [
      //     Image.asset(
      //       Assets.images.backgr.path,
      //       width: size.width,
      //       height: size.height,
      //       fit: BoxFit.fill,
      //     ),
      //     Center(
      //       child: Image.asset(
      //         Assets.images.logoFoodie.path,
      //         width: 160.0,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
