import 'package:fitness_app/screens/landing_screen/home_page.dart';
import 'package:fitness_app/screens/welcome/welcome_screen.dart';
import 'package:fitness_app/ui_stat_management/landing_screen_state.dart';
import 'package:fitness_app/ui_widgets/basic_widgets.dart';
import 'package:fitness_app/ui_widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../app_color/color.dart';
class LandingScreen extends ConsumerWidget {
   const LandingScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final pageController=ref.watch(landingPageControllerProvider);

    return Scaffold(
      backgroundColor:  AppColor.primaryColor,
      body: Column(
        children: [
          SizedBox(height: 50,),
          Container(
            height: MediaQuery.sizeOf(context).height*0.75,
            color:AppColor.primaryColor,
            child: LandingPages()
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                spacing: 20,
                children: [
                  SmoothPageIndicator(
                    controller:pageController,
                    count: 3, // Dynamic count
                    effect: ExpandingDotsEffect(
                    // expansionFactor: 3.0,
                      activeDotColor: AppColor.primaryColor,
                      dotColor: Colors.grey.shade300,
                      dotHeight: 8.0,
                      dotWidth: 10.0,
                      spacing: 10.0,
                    ),
                  ),
                  DividerWidget(height: 20,),
                 Row(
                   mainAxisAlignment:ref.watch(landingPageIndex)!=2? MainAxisAlignment.spaceEvenly:MainAxisAlignment.center,
                   children: [
                     if(ref.watch(landingPageIndex)!=2)ButtonWidget(onPress: (){
                       ref.read(landingPageIndex.notifier).state=2;
                       pageController.animateToPage(
                           ref.watch(landingPageIndex),
                           duration: Duration(microseconds: 2),
                           curve: Curves.bounceIn);
                     },
                       width: MediaQuery.sizeOf(context).width*0.4,
                       color: AppColor.optionalColor,
                       title: "Skip",
                       titleColor: AppColor.primaryColor,
                     ),
                     ButtonWidget(onPress: (){
                       if(ref.watch(landingPageIndex)==2){
                         Navigator.push(context, MaterialPageRoute(builder: (builder)=>WelcomeScreen()));
                       }else {
                         int index=ref.watch(landingPageIndex);
                         ref.read(landingPageIndex.notifier).state=index+1;
                         pageController.animateToPage(
                             ref.watch(landingPageIndex),
                             duration: Duration(microseconds: 300),
                             curve: Curves.bounceInOut);
                       }
                     },
                       width:ref.watch(landingPageIndex)==2? MediaQuery.sizeOf(context).width*0.9:MediaQuery.sizeOf(context).width*0.4,
                       color: AppColor.primaryColor,
                       title: "Continue",
                       titleColor: Colors.white,
                     )
                   ],
                 )
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}

