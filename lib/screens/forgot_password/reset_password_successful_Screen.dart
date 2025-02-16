
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app_color/color.dart';
import '../../ui_stat_management/otp_received_screen_state.dart';
import '../../ui_widgets/button_widget.dart';
import '../../ui_widgets/text_widget.dart';
import '../../ui_widgets/textformfield_widget.dart';

class ResetPasswordSuccessfulScreen extends ConsumerWidget {
  ResetPasswordSuccessfulScreen({super.key});
  final TextEditingController controller=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.secondaryColor,
      ),
      body: Padding(padding: EdgeInsets.all(5.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,//why this property not work????
          children: [
            TextWidget(text: "You're All Set!",isBold: true,fontSize: 31,),
            TextWidget(text: " Your password has been successfully updated.",fontSize: 17,),
          ],
        ),
      ),
      bottomSheet: Container(
          color: AppColor.secondaryColor,
          padding: EdgeInsets.all(10.0),
          child:   ButtonWidget(onPress: (){
          },title: "Go to Homepage",
            color: AppColor.primaryColor,
            isBold: false,
            fontSize: 18,
          )
      ),
    );
  }
}
