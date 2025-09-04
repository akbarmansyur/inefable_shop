import 'package:cached_network_image/cached_network_image.dart';
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
  @override
  Widget build(BuildContext context) {
    IntroController controller = Get.find();
    return Scaffold(
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
                    child: CachedNetworkImage(
                      httpHeaders: {
                        'User-Agent':
                            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
                      },
                      imageUrl: controller.items[index].imagePath,
                      fit: BoxFit.cover,
                      placeholder: (context, url) {
                        return Container(color: Colors.grey[300]);
                      },
                      errorWidget: (context, url, error) {
                        print('Error loading image: $error');
                        return Container(
                          color: Colors.grey[300],
                          child: Icon(Icons.error),
                        );
                      },
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
                          opacity: controller.introIndex.value != 2 ? 1.0 : 0.0,
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
    );
  }
}
