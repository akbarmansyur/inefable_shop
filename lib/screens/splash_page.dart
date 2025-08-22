import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:inefable_shop/app_properties.dart';
import 'package:inefable_shop/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(color: transparentYellow),
        child: SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Expanded(child: Image.asset('assets/logo.png')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(text: 'Powered by '),
                        TextSpan(
                          text: 'Inefable',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

  // late Animation<double> opacity;
  // late AnimationController controller;

  // @override
  // void initState() {
  //   super.initState();
  //   controller = AnimationController(
  //     duration: Duration(milliseconds: 2500),
  //     vsync: this,
  //   );
  //   opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
  //     ..addListener(() {
  //       setState(() {});
  //     });
  //   controller.forward().then((_) {
  //     navigationPage();
  //   });
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  // void navigationPage() {
  //   Navigator.of(
  //     context,
  //   ).pushReplacement(MaterialPageRoute(builder: (_) => WelcomeBackPage()));
  // }
