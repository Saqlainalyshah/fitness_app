import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/ui_widgets/button_widget.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../ui_models/welcome_screen_model.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            spacing: 20,
            //crossAxisAlignment: CrossAxisAlignment.center,
           // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              TextWidget(text: "Let's Get Started!",isBold: true,fontSize: 30,),
              //Let's dive in into your account
              TextWidget(text: "Let's dive in into your account",fontSize: 18,),
              ListView.separated(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: WelcomeScreenModel.list.length,
                  itemBuilder: (context,index){
                    return ButtonWidget(
                      color: Colors.white,
                      isBorder: true,
                      onPress: (){
                      },
                      widget: Row(
                        spacing: 60,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(Icons.add,color: Colors.red,),
                          ),
                          TextWidget(text: WelcomeScreenModel.list[index].title,isBold: true,)
                        ],
                      ),

                    );



              }, separatorBuilder: (BuildContext context, int index) {
                  return Padding(padding: EdgeInsets.all(10));
              },),
              SizedBox(height: 10,),
              ButtonWidget(onPress: (){

              },
                title: "Sign up",

              ),
              ButtonWidget(onPress: (){

              },
                title: "Sign in",
                titleColor: AppColor.primaryColor,
                color: AppColor.optionalColor,

              )
              
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(20),
      color: AppColor.secondaryColor,
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(text: "Privacy Policy"),
          TextWidget(text: "."),
          TextWidget(text: "Terms of Service")
        ],
      ),
      ),
    );
  }
}
