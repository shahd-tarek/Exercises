import 'package:exercises/core/component/custom_bottom.dart';
import 'package:exercises/core/navigation/app_router.dart';
import 'package:exercises/core/utils/constants.dart';
import 'package:exercises/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Image.asset(
              "assets/images/Image.png",
              width: MediaQuery.sizeOf(context).width,
            ),
          ),
          Text(
            "   Wherever You Are\nHealth Is Number One",
            style: Styles.textStyle24.copyWith(
              fontWeight: FontWeight.bold,
              color: kTextColor,
            ),
          ),
          Text(
            "There is no instant way to a healthy life",
            style: Styles.textStyle16.copyWith(color: Colors.grey),
          ),
          Image.asset("assets/images/carousel.png"),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: CustomButton(
              backgroundColor: kTextColor,
              textColor: Colors.white,
              text: "Get Started",
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kHomeView);
              },
            ),
          ),
        ],
      ),
    );
  }
}
