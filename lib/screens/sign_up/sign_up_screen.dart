import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/ui_stat_management/sign_up_screen_state.dart';
import 'package:fitness_app/ui_widgets/basic_widgets.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../ui_models/welcome_screen_model.dart';
import '../../ui_widgets/button_widget.dart';
import '../../ui_widgets/textformfield_widget.dart';

class SignUpScreen extends ConsumerWidget {
   SignUpScreen({super.key});
   final _formKey = GlobalKey<FormState>();
final TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.secondaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(5.0),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(text: "Join TrackFit Today 👤",isBold: true,fontSize: 31,),
              TextWidget(text: "Create your account and start tracking your steps.",fontSize: 18,),
              Form(
                key: _formKey, // ✅ Wrap TextFormField in Form widget
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    TextWidget(text: "Email",fontSize: 18,),
                    TextFieldWidget(
                      controller: controller,
                      fillColor: Colors.grey.shade200,
                      hintText: 'Email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid email';
                        }
                        return '';
                      },
                    ),
                    TextWidget(text: "Password",fontSize: 18,),
                    TextFieldWidget(
                      fillColor: Colors.grey.shade200,
                      controller: controller,
                      hintText: 'Password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is wrong';
                        }
                        return '';
                      },
                    ),
                  ],
                ),
              ),
              Row(
                //spacing: 10,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: ref.watch(signupScreenCheckBoxProvider),
                    onChanged: (value) {
                      ref.read(signupScreenCheckBoxProvider.notifier).state = value!;
                    },
                    activeColor: AppColor.primaryColor,
                    checkColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    side: BorderSide(
                      color: AppColor.primaryColor,
                      width: 2.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 18),  // ✅ Ensures text inherits proper styling
                      children: [
                        TextSpan(
                          text: "I agree to the ",
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text: "Terms & Conditions.  ",
                          style: TextStyle(color: AppColor.primaryColor, ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 15),  // ✅ Ensures text inherits proper styling
                      children: [
                        TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text: "Sign in",
                          style: TextStyle(color: AppColor.primaryColor, ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(child: DividerWidget()),
                 TextWidget(text: "   or   "),
                  Expanded(child: DividerWidget()),
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
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
              ButtonWidget(onPress: (){

              },title: "Sign up",
              color: AppColor.primaryColor,
              )


          ],
        ),
        ),
      ),
    );
  }
}
