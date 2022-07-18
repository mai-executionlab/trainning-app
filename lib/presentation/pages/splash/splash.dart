import 'dart:math';

import 'package:flutter/material.dart';
import 'package:training_app/presentation/pages/login/login_page.dart';
import 'package:training_app/presentation/theme/theme.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animation;
  late Animation<double> _curve;

  late AnimationController _logoController;

  listenBGAnimation() {
    _animationController.forward();
    _animation.addListener(() {
      setState(() {});
      if (_animation.isCompleted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 1000),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return const LoginPage();
            },
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      }
    });
    // Timer(const Duration(milliseconds: 2000), () {
    //   Navigator.of(context).push(
    //     PageRouteBuilder(
    //       transitionDuration: const Duration(milliseconds: 1000),
    //       pageBuilder: (BuildContext context, Animation<double> animation,
    //           Animation<double> secondaryAnimation) {
    //         return const LoginPage();
    //       },
    //       transitionsBuilder: (
    //         BuildContext context,
    //         Animation<double> animation,
    //         Animation<double> secondaryAnimation,
    //         Widget child,
    //       ) {
    //         return FadeTransition(
    //           opacity: animation,
    //           child: child,
    //         );
    //       },
    //     ),
    //   );
    // });
  }

  @override
  void initState() {
    
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    _logoController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900))
      ..forward()
      ..addListener(() {
        setState(() {});
      });
    _curve = CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutCubic);

    _animation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween(begin: 0.0, end: 0.9).chain(
              CurveTween(curve: Curves.linear),
            ),
            weight: 30.0),
        TweenSequenceItem<double>(
            tween: Tween(begin: 0.9, end: 0.9).chain(
              CurveTween(curve: Curves.linear),
            ),
            weight: 40.0),
        TweenSequenceItem<double>(
            tween: Tween(begin: 0.9, end: 500.0).chain(
              CurveTween(curve: Curves.linear),
            ),
            weight: 30.0),
      ],
    ).animate(_curve);
    // listenOpacityAnimation();
  }

  @override
  void dispose() {
    
    _animationController.dispose();
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          // fit: StackFit.passthrough,
          children: [
            SizedBox.fromSize(size: size),
            Transform.scale(
              scale: sqrt2,
              origin: Offset(size.width / 2, -size.width / 2),
              child: Transform.rotate(
                angle: pi / 4,
                origin: Offset(size.width / 2, -size.width / 2),
                child: Container(
                  height: size.width,
                  width: size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topRight,
                          stops: [
                        0.002 * _animation.value,
                        0.01 * _animation.value,
                        _animation.value
                      ],
                          colors: const [
                        AppColors.white,
                        AppColors.primaryColor,
                        AppColors.white
                      ])),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Transform.scale(
                scale: 2,
                origin: Offset(-size.width / 2, size.width / 2),
                child: Transform.rotate(
                  angle: pi / 4,
                  origin: Offset(-size.width / 2, size.width / 2),
                  child: Container(
                    height: size.width,
                    width: size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            end: Alignment.topRight,
                            stops: [
                          0.002 * _animation.value,
                          0.01 * _animation.value,
                          _animation.value
                        ],
                            colors: const [
                          AppColors.white,
                          AppColors.secondaryColor,
                          AppColors.white,
                        ])),
                  ),
                ),
              ),
            ),
            // Positioned.fill(
            //   top: size.height * 0.9 / 4,
            //   child: AnimatedOpacity(
            //     curve: Curves.easeInCubic,
            //     duration: const Duration(milliseconds: 1000),
            //     opacity: _moveController.value,
            //     child: const LoginPage(),
            //   ),
            // ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: AnimatedOpacity(
                  onEnd: listenBGAnimation,
                  curve: Curves.easeInExpo,
                  duration: const Duration(milliseconds: 500),
                  opacity: _logoController.value,
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset(
                      AppAssets.logoColor,
                      height: 50,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// 358273336646265
