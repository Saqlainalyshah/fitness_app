import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/ui_stat_management/sign_up_screen_state.dart';
import 'package:fitness_app/ui_widgets/basic_widgets.dart';
import 'package:fitness_app/ui_widgets/button_widget.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserFormScreen extends StatelessWidget {
  const UserFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.secondaryColor,

        title: LinearProgressIndicator(
          value: 0.2,
          color: AppColor.primaryColor,
          backgroundColor: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
          minHeight: 15,
        ),
        actions: [
          TextWidget(text: "1/6",isBold: true,fontSize: 18,),
          SizedBox(width: 20,)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),  // ✅ Ensures text inherits proper styling
              children: [
                TextSpan(
                  text: "Select Your ",
                  style: TextStyle(color: Colors.black,),
                ),
                TextSpan(
                  text: " Gender ",
                  style: TextStyle(color: AppColor.primaryColor, ),
                ),
              ],
            ),
          ),
          TextWidget(text: "Let's start by understanding you",fontSize: 19,),
         Consumer(
           builder:(context,ref,child)=> Row(
             children: List.generate((2), (index){
               List<String> list=['assets/images/gender/man.png','assets/images/gender/women.png'];
               List<String> l=['man','women'];
               return Column(
                 children: [
                   GestureDetector(
                     onTap:(){
                       if(ref.watch(signUpScreenGenderIndexProvider)==index){
                          ref.read(signUpScreenGenderIndexProvider.notifier).state=  ref.watch(signUpScreenGenderIndexProvider);
                       }else{
                         ref.read(signUpScreenGenderIndexProvider.notifier).state=index;
                       }
                       ref.read(signUpScreenIsColorProvider.notifier).state=!ref.watch(signUpScreenIsColorProvider);
                     },
                     child: Container(
                         margin: EdgeInsets.all(10),
                         padding: EdgeInsets.symmetric(vertical:20,horizontal: 5),
                         height: ref.watch(signUpScreenGenderIndexProvider)==index? MediaQuery.sizeOf(context).height*0.55:MediaQuery.sizeOf(context).height* 0.3,
                         width: ref.watch(signUpScreenGenderIndexProvider)==index? MediaQuery.sizeOf(context).width*0.5:MediaQuery.sizeOf(context).width*0.35 ,
                        //color: Colors.grey,
                         child: Stack(
                           alignment: Alignment.bottomCenter,
                           children: [
                             if(ref.watch(signUpScreenGenderIndexProvider)==index) ...[
                              Positioned(
                                top: 30,
                                left: 0,
                                right: ref.watch(signUpScreenGenderIndexProvider)==1?150:90,
                                child:  Container(
                                  //width: 10,
                                  height: 15,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.primaryColor
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 50,
                                left: ref.watch(signUpScreenGenderIndexProvider)==1?30:120,
                                right: 0,
                                child:  Container(
                                  //width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.primaryColor
                                  ),
                                  //AppColor.primaryColor,

                                ),
                              ),
                              Positioned(
                                top: 130,
                                left: ref.watch(signUpScreenGenderIndexProvider)==1?100:130,
                                right: 0,
                                child:  Container(
                                  //width: 10,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.primaryColor
                                  ),
                                  //AppColor.primaryColor,

                                ),
                              ),
                              Positioned(
                                top: ref.watch(signUpScreenGenderIndexProvider)==1?170:180,
                                left:ref.watch(signUpScreenGenderIndexProvider)==1?70: 100,
                                right: 0,
                                child:  Container(
                                  height: 5,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.primaryColor
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 150,
                                left: 0,
                                right: 120,
                                child:  Container(
                                  //width: 10,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.primaryColor
                                  ),
                                  //AppColor.primaryColor,

                                ),
                              ),
                              Positioned(
                                top: 65,
                                left: 8,
                                right: ref.watch(signUpScreenGenderIndexProvider)==1?50:0,
                                child:  Container(
                                  //width: 10,
                                  height: 110,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.primaryColor
                                  ),
                                  //AppColor.primaryColor,

                                ),
                              ),
                            ],
                             ClipOval(
                               child:Container(
                                  // width:200,
                                   height: ref.watch(signUpScreenGenderIndexProvider)==index? 60:30,
                                   color: ref.watch(signUpScreenGenderIndexProvider)==index?AppColor.primaryColor:Colors.grey.shade300 //AppColor.primaryColor,
                               ),
                             ),
                             Positioned(
                               top: 20,
                                 bottom: 20,
                                 child: Image.asset(list[index],)),
                           ],
                         )
                     ),
                   ),
                 if( ref.watch(signUpScreenGenderIndexProvider)==index)TextWidget(text: l[index],fontSize: 20,isBold: true,)
                 ],
               );
             }),
           ),
         ),
          SizedBox(height: 20,),
          DividerWidget(),
        ],
      ),
      bottomSheet: Container(
        color: AppColor.secondaryColor,
        padding: EdgeInsets.all(20),
        child: Row(
           spacing: 20,
          children: [
            Expanded(child: ButtonWidget(onPress: (){},title: 'Skip',color: AppColor.optionalColor,titleColor: AppColor.primaryColor,)),
            Expanded(child: ButtonWidget(onPress: (){},title: 'Continue',color: AppColor.primaryColor,)),

          ],
        ),
      ),
    );
  }
}