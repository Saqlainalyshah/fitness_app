import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/ui_stat_management/sign_up_screen_state.dart';
import 'package:fitness_app/ui_widgets/basic_widgets.dart';
import 'package:fitness_app/ui_widgets/button_widget.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      body:Padding(padding: EdgeInsets.all(10),
      child: Container(
        height: 200,
        color: Colors.red,
        child: ListWheelScrollView(itemExtent: 50,
            offAxisFraction: 0.0,
           // perspective: 2.0,
            overAndUnderCenterOpacity: 0.4,
            physics: BouncingScrollPhysics(),
            ///squeeze: 2.0,
            children: List.generate(20, (index)=>TextWidget(text: index.toString(),isBold: true,fontSize: 20,))),
      ),
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

Widget _buildSpanText(String simpleText,String spanText,String? afterSpanText){
  return  RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,),  // ✅ Ensures text inherits proper styling
      children: [
        TextSpan(
          text: simpleText,
          style: TextStyle(color: Colors.black,),
        ),
        TextSpan(
          text: spanText,
          style: TextStyle(color: AppColor.primaryColor, ),
        ),
        if(afterSpanText!=null)TextSpan(
          text:  afterSpanText,
          style: TextStyle(color: Colors.black,),
        ),
      ],
    ),
  );
}



class GenderWidget extends StatelessWidget {
  const GenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildSpanText("Select Your", " Gender", null),
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
    );
  }
}

class LifeStyleWidget extends StatelessWidget {
  const LifeStyleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildSpanText("Do you live a", " Sedentary", " Lifestyle? "),
        TextWidget(text: "Tell us about your daily routine.",fontSize: 19,),
        Image.asset("assets/images/gender/lifestyle.png",height: MediaQuery.sizeOf(context).height*0.5,),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(2, (index){
              List<String> list=['No','Yes'];
             return Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.primaryColor
                ),
               child: Center(child: TextWidget(text: list[index],isBold: true,fontSize: 18,color: AppColor.secondaryColor,)),
              );
            }),),
        ),
        SizedBox(height: 20,),
        DividerWidget(),
      ],
    );
  }
}

class OldWidget extends StatelessWidget {
  const OldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildSpanText("How", " Old", " Are you? "),
        TextWidget(text: "Share your age with us.",fontSize: 19,),
        Image.asset("assets/images/gender/lifestyle.png",height: MediaQuery.sizeOf(context).height*0.5,),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(2, (index){
              List<String> list=['No','Yes'];
              return Container(

                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.primaryColor
                ),
                child: Center(child: TextWidget(text: list[index],isBold: true,fontSize: 18,color: AppColor.secondaryColor,)),
              );
            }),),
        ),
        SizedBox(height: 20,),
        DividerWidget(),
      ],
    );
  }
}


class AgePickerScreen extends StatefulWidget {
  @override
  _AgePickerScreenState createState() => _AgePickerScreenState();
}

class _AgePickerScreenState extends State<AgePickerScreen> {
  final FixedExtentScrollController _controller =
  FixedExtentScrollController(initialItem: 4);
  int selectedAge = 28;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 250,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.5),
                      Colors.black,
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0.2),
                    ],
                    stops: [0.0, 0.2, 0.5, 0.8, 1.0],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstIn,
                child: ListWheelScrollView.useDelegate(
                  controller: _controller,
                  itemExtent: 40,
                  physics: FixedExtentScrollPhysics(),
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedAge = 24 + index;
                    });
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    builder: (context, index) {
                      int age = 24 + index;
                      bool isSelected = age == selectedAge;
                      return Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$age',
                              style: TextStyle(
                                fontSize: isSelected ? 26 : 18,
                                fontWeight:
                                isSelected ? FontWeight.bold : FontWeight.w400,
                                color: isSelected ? Colors.purple : Colors.grey,
                              ),
                            ),
                            if (isSelected)
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                  'years',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                    childCount: 10,
                  ),
                ),
              ),
              Positioned(
                top: 90,
                left: 50,
                right: 50,
                child: Divider(
                  thickness: 1,
                  color: Colors.purple,
                ),
              ),
              Positioned(
                bottom: 90,
                left: 50,
                right: 50,
                child: Divider(
                  thickness: 1,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
