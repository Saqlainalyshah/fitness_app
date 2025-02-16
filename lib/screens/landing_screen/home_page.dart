import 'package:fitness_app/ui_models/landing_page_model.dart';
import 'package:fitness_app/ui_stat_management/landing_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../ui_widgets/text_widget.dart';

class LandingPages extends ConsumerWidget {
  const LandingPages({super.key,

  });



  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final pageController=ref.watch(landingPageControllerProvider);

    return PageView.builder(
        itemCount: LandingPageModel.landingPageModelList.length,
        controller: pageController,
        //physics: BouncingScrollPhysics(),
        onPageChanged: (index){
          ref.watch(landingPageIndex.notifier).state=index;
        },
        itemBuilder: (context,index){
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  LandingPageModel.landingPageModelList[index].imageUrl,
                  width: double.infinity,
                ),
              ),
              // Shadow using CustomPaint
              Positioned(
                bottom: 0,
                child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, 260),
                  painter: ShadowPainter(),
                ),
              ),

              // Main Clipped Container
              Positioned(
                bottom: 0,
                child: ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    height: 260,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SizedBox(height: 50,),
                          TextWidget(text: LandingPageModel.landingPageModelList[index].title,fontSize: 32,isBold: true,textAlign: TextAlign.center,),
                          TextWidget(text: LandingPageModel.landingPageModelList[index].description,
                            textAlign: TextAlign.center,fontSize: 17,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}

class ShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint shadowPaint = Paint()
      ..color = Colors.grey.withOpacity(0.3) // Shadow color
      ..maskFilter = MaskFilter.blur(BlurStyle.solid, 5.0); // Blur effect

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width * 0.5, 90, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, shadowPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Custom Clipper
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width * 0.5, 90, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
