import 'package:flutter/material.dart';
import '../../app_color/color.dart';
import '../../ui_widgets/button_widget.dart';
import '../../ui_widgets/text_widget.dart';
import '../../ui_widgets/textformfield_widget.dart';

class SendOtpScreen extends StatelessWidget {
  SendOtpScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.secondaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(5.0),
          child: Column(
            spacing: 15,
           // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(text: "Forgot Your Password? 🔑 ",isBold: true,fontSize: 31,),
              TextWidget(text: "Enter the email associated with your TrackFit account below. We'll send you a one-time passcode (OTP) to reset your password.",fontSize: 18,),
              Form(
                key: _formKey, // ✅ Wrap TextFormField in Form widget
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(text: "Your Registered Email",fontSize: 17,isBold: true,),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: AppColor.secondaryColor,
        padding: EdgeInsets.all(10.0),
        child:   ButtonWidget(onPress: (){
        },title: "Send OTP Code",
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}
