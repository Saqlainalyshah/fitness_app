import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app_color/color.dart';
import '../../ui_stat_management/otp_received_screen_state.dart';
import '../../ui_widgets/button_widget.dart';
import '../../ui_widgets/text_widget.dart';
import '../../ui_widgets/textformfield_widget.dart';

class OtpReceivedScreen extends ConsumerWidget {
   OtpReceivedScreen({super.key});
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(text: "Enter OTP Code 🔐 ",isBold: true,fontSize: 31,),
              TextWidget(text: "Check your email inbox for a one-time passcode (OTP) from TrackFit. Enter the code below to continue.",fontSize: 18,),
              Row(
                spacing: 10,
                children: [
                Expanded(
                  child: TextFieldWidget(
                    controller: controller,
                    textInputType: TextInputType.number,
                    fillColor: Colors.grey.shade200,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid email';
                      }
                      return '';
                    },
                  ),
                ),
                Expanded(child: TextFieldWidget(
                  controller: controller,
                  textInputType: TextInputType.number,
                  fillColor: Colors.grey.shade200,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid email';
                    }
                    return '';
                  },
                ),),
                Expanded(
                  child: TextFieldWidget(
                    controller: controller,
                    textInputType: TextInputType.number,
                    fillColor: Colors.grey.shade200,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid email';
                      }
                      return '';
                    },
                  ),
                ),
                Expanded(
                  child: TextFieldWidget(
                    controller: controller,
                    textInputType: TextInputType.number,
                    fillColor: Colors.grey.shade200,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid email';
                      }
                      return '';
                    },
                  ),
                ),

              ],
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 18),  // ✅ Ensures text inherits proper styling
                    children: [
                      TextSpan(
                        text: "You can resend the code in",
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: ' ${ref.watch(countdownProvider)}',
                        style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.w500 ),
                      ),
                      TextSpan(
                        text: " seconds",
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              ButtonWidget(onPress: (){
               ref.read(countdownProvider.notifier).restartCountdown();

              },
              title: "Resend code",
                color:ref.watch(countdownProvider)==0? AppColor.primaryColor:Colors.transparent,
                titleColor: ref.watch(countdownProvider)==0? AppColor.secondaryColor:Colors.black,
                isBold: false,
                fontSize: 18,

              )
            ],
          ),
        ),
      ),
      bottomSheet: ref.watch(countdownProvider)!=0?Container(
        color: AppColor.secondaryColor,
        padding: EdgeInsets.all(10.0),
        child:   ButtonWidget(onPress: (){
        },title: "Verify OTP",
          color: AppColor.primaryColor,
          //isBold: false,
          fontSize: 20,
        )
      ):null,
    );
  }
}
