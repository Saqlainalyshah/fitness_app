import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/ui_stat_management/home_screen_state.dart';
import 'package:fitness_app/ui_widgets/basic_widgets.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../ui_widgets/dropdown_widget.dart';
import '../../ui_widgets/step_counter.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: Text("Home"),
        centerTitle: true,
        actions: [Icon(Icons.more_vert_outlined)],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          spacing: 20,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.sizeOf(context).height * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.secondaryColor),
              child: StepCounter(),
            ),
            Container(
                height: MediaQuery.sizeOf(context).height * 0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.secondaryColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.timelapse),
                        TextWidget(text: "1h 14m", isBold: true, fontSize: 16),
                        TextWidget(text: "time", fontSize: 14),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: VerticalDivider(
                        thickness: 1,
                        width: 1,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.timelapse),
                        TextWidget(text: "1h 14m", isBold: true, fontSize: 16),
                        TextWidget(text: "time", fontSize: 14),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: VerticalDivider(
                        thickness: 1,
                        width: 1,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.timelapse),
                        TextWidget(text: "1h 14m", isBold: true, fontSize: 16),
                        TextWidget(text: "time", fontSize: 14),
                      ],
                    ),
                  ],
                )),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.secondaryColor),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "Your Progress",
                          isBold: true,
                          fontSize: 20,
                        ),
                        DropdownWidget(
                          value: ref.watch(homeScreenProgressValueProvider),
                          list: ref.watch(homeScreenProgressListProvider),
                          onChanged: (String? value) {
                            if (value != null) {
                              ref
                                  .read(homeScreenProgressValueProvider.notifier)
                                  .state = value;
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DividerWidget(height: 0,),
                  ),
                  Expanded(
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        
                        itemCount: 7,
                        itemBuilder: (context,index){
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      // padding: EdgeInsets.only(left: 10),
                                      color: AppColor.primaryColor,
                                      backgroundColor: Colors.grey.shade400,
                                      value: 0.5,),
                                  ),
                                  TextWidget(text: '43',isBold: true,),
                                ],
                              ),
                              TextWidget(text: 'Mon',isBold: true,color: Colors.grey.shade700,),
                            ],
                          );
                                },
                        separatorBuilder: (context,index){
                          return Padding(padding: EdgeInsets.all(10));
                        },
                    
                    ),
                  ),
                  //DateSelectorWidget()
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}

