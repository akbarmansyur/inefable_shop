import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inefable_shop/app_properties.dart';
import 'package:inefable_shop/controller/intro_controller.dart';
import 'package:inefable_shop/route/app_pages.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController controller = PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    IntroController controller = Get.find();
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              controller: controller.pageController,
              itemCount: controller.items.length,
              onPageChanged: (value) => controller.changeIntroIndex(value),
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    SizedBox.expand(
                      child: Image.network(
                        controller.items[index].imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox.expand(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.black, Colors.transparent],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 150,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.items[index].title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white54,
                              ),
                            ),
                            Text(
                              controller.items[index].description,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              bottom: 16.0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(controller.items.length, (index) {
                        return Obx(
                          () => Container(
                            margin: const EdgeInsets.all(8.0),
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: darkYellow, width: 2),
                              color: controller.introIndex.value == index
                                  ? yellow
                                  : Colors.white,
                            ),
                          ),
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Opacity(
                            opacity: pageIndex != 2 ? 1.0 : 0.0,
                            child: TextButton(
                              child: Text(
                                'SKIP',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              onPressed: () {
                                Get.offAllNamed(Routes.home);
                              },
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            child: Obx(
                              () => Text(
                                controller.introIndex.value == 2
                                    ? "FINISH"
                                    : "NEXT",
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (controller.introIndex.value == 2) {
                                Get.offAllNamed(Routes.home);
                              } else {
                                controller.pageController.nextPage(
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.linear,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
