import 'package:fitness_app/ui_stat_management/sign_in_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_color/color.dart';
import '../../ui_models/welcome_screen_model.dart';
import '../../ui_widgets/basic_widgets.dart';
import '../../ui_widgets/button_widget.dart';
import '../../ui_widgets/text_widget.dart';
import '../../ui_widgets/textformfield_widget.dart';

class SignInScreen extends ConsumerWidget {
   SignInScreen({super.key});
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
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(text: "Welcome Back! 👋",isBold: true,fontSize: 31,),
              TextWidget(text: "Sign in to continue your fitness journey.",fontSize: 18,),
              Form(
                key: _formKey, // ✅ Wrap TextFormField in Form widget
                child: Column(
                  spacing: 5,
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
                spacing: 5,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    // tristate: true,
                    value: ref.watch(signInScreenCheckBoxProvider),
                    onChanged: (value) {
                      ref.read(signInScreenCheckBoxProvider.notifier).state = value!;
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
                  Text(
                     "Remember me",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 17),
                  ),
                  Spacer(),
                  Text(
                   "Forgot Password? ",
                    style: TextStyle(color: AppColor.primaryColor,fontSize: 17, fontWeight: FontWeight.w700 ),
                  ),
                ],
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
                itemCount: 3,
                itemBuilder: (context,index){
                  return ButtonWidget(
                    color: Colors.white,
                    isBorder: true,
                    onPress: (){},
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

              },title: "Sign in",
                color: AppColor.primaryColor,
              )


            ],
          ),
        ),
      ),
    );
  }
}
