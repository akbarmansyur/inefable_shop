import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inefable_shop/app_properties.dart';
import 'package:inefable_shop/controller/product_controller.dart';
import 'package:inefable_shop/models/product_model.dart';
import 'package:inefable_shop/screens/rating/rating_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDisplay extends StatelessWidget {
  const ProductDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.find();

    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: controller.pageSliderController,
            itemCount:
                controller.product.value?.images.length ??
                1, // Jika tidak ada gambar, tetap tampilkan 1 placeholder
            itemBuilder: (context, index) {
              // Jika tidak ada gambar, tampilkan placeholder
              if (controller.product.value == null ||
                  controller.product.value!.images.isEmpty) {
                return Container(
                  color: Colors.grey[300],
                  width: double.infinity,
                  child: Icon(Icons.image_not_supported),
                );
              }

              // Tampilkan gambar dengan CachedNetworkImage
              return CachedNetworkImage(
                imageUrl: controller.product.value!.images[index],
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Container(color: Colors.grey[300], width: double.infinity),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey[300],

                  width: double.infinity,
                  child: Icon(Icons.error),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 12),
        SmoothPageIndicator(
          controller: controller.pageSliderController,
          count: controller.product.value?.images.length ?? 1,
          effect: WormEffect(
            activeDotColor: Colors.red,
            dotColor: Colors.grey[300]!,
            dotHeight: 8,
            dotWidth: 8,
          ),
        ),
      ],
    );

    // return CachedNetworkImage(
    //   imageUrl: controller.product.value?.images[0] ?? "",
    //   width: double.infinity,
    //   fit: BoxFit.cover,
    //   placeholder: (context, url) => Container(
    //     color: Colors.grey[300],
    //     height: 400,
    //     width: double.infinity,
    //   ),
    //   errorWidget: (context, url, error) => Container(
    //     color: Colors.grey[300],
    //     height: 400,
    //     width: double.infinity,
    //     child: Icon(Icons.error),
    //   ),
    // );
  }
}

// Positioned(
//           top: 30.0,
//           right: 0,
//           child: Container(
//             width: MediaQuery.of(context).size.width / 1.5,
//             height: 85,
//             padding: EdgeInsets.only(right: 24),
//             decoration: BoxDecoration(
//               color: darkGrey,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(8.0),
//                 bottomLeft: Radius.circular(8.0),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Color.fromRGBO(0, 0, 0, 0.16),
//                   offset: Offset(0, 3),
//                   blurRadius: 6.0,
//                 ),
//               ],
//             ),
//             child: Align(
//               alignment: Alignment(1, 0),
//               child: RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: 'Rp ${controller.product.value?.price}',
//                       style: const TextStyle(
//                         color: const Color(0xFFFFFFFF),
//                         fontWeight: FontWeight.w400,
//                         fontFamily: "Montserrat",
//                         fontSize: 36.0,
//                       ),
//                     ),
//                     TextSpan(
//                       text: '.58',
//                       style: const TextStyle(
//                         color: const Color(0xFFFFFFFF),
//                         fontWeight: FontWeight.w400,
//                         fontFamily: "Montserrat",
//                         fontSize: 18.0,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),

//         Positioned(
//           left: 20.0,
//           bottom: 0.0,
//           child: RawMaterialButton(
//             onPressed: () => Navigator.of(
//               context,
//             ).push(MaterialPageRoute(builder: (_) => RatingPage())),
//             constraints: const BoxConstraints(minWidth: 45, minHeight: 45),
//             child: Icon(
//               Icons.favorite,
//               color: Color.fromRGBO(255, 137, 147, 1),
//             ),
//             elevation: 0.0,
//             shape: CircleBorder(),
//             fillColor: Color.fromRGBO(255, 255, 255, 0.4),
//           ),
//         ),
