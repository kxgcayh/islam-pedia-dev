import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:islam_pedia/generated/assets.gen.dart';
import 'package:islam_pedia/generated/colors.gen.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends HookWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.delayed(const Duration(seconds: 3)).then((_) {
        context.go('/onboarding');
      });
      return;
    }, []);

    return Scaffold(
      backgroundColor: ColorName.yellow,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 95.h),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Text(
                'Islam Pedia',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 180.h,
                child: Lottie.asset(Assets.jsons.loading),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
