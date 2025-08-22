import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:inefable_shop/models/intro_model.dart';

class IntroController extends GetxController {
  PageController pageController = PageController();
  var introIndex = 0.obs;

  changeIntroIndex(val) {
    introIndex.value = val;
  }

  final List<IntroModel> items = [
    IntroModel(
      imagePath:
          'https://images.unsplash.com/photo-1577525179375-b870f894a365?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8eW91bmclMjBmYXNoaW9ufGVufDB8fDB8fHww',
      title: 'Gaya Lokal, Kelas Internasional',
      description:
          'Perpaduan karya anak bangsa dan sentuhan modern yang menciptakan fashion tak lekang oleh waktu.',
    ),
    IntroModel(
      imagePath:
          'https://images.unsplash.com/photo-1625562195590-8fb6b0d7fea6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHlvdW5nJTIwZmFzaGlvbnxlbnwwfHwwfHx8MA%3D%3D',
      title: 'Ekspresi Tanpa Batas',
      description:
          'Desain unik yang merepresentasikan jiwa bebas dan kreatifitas tanpa kompromi.',
    ),
    IntroModel(
      imagePath:
          'https://images.unsplash.com/photo-1638863491873-99767d1b8145?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHlvdW5nJTIwZmFzaGlvbnxlbnwwfHwwfHx8MA%3D%3D',
      title: 'Nyaman untuk Setiap Langkah',
      description:
          'Material premium yang membuatmu tampil percaya diri dari pagi hingga malam.',
    ),
  ];
}
