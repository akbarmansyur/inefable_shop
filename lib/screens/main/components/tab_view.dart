// import 'package:flutter/material.dart';
// import 'package:inefable_shop/models/category.dart';
// import 'category_card.dart';
// import 'recommended_list.dart';

// class TabView extends StatelessWidget {
//   final List<Category> categories = [
//     Category(
//       Color(0xffFCE183),
//       Color(0xffF68D7F),
//       'Gadgets',
//       'assets/jeans_5.png',
//     ),
//     Category(
//       Color(0xffF749A2),
//       Color(0xffFF7375),
//       'Clothes',
//       'assets/jeans_5.png',
//     ),
//     Category(
//       Color(0xff00E9DA),
//       Color(0xff5189EA),
//       'Fashion',
//       'assets/jeans_5.png',
//     ),
//     Category(
//       Color(0xffAF2D68),
//       Color(0xff632376),
//       'Home',
//       'assets/jeans_5.png',
//     ),
//     Category(
//       Color(0xff36E892),
//       Color(0xff33B2B9),
//       'Beauty',
//       'assets/jeans_5.png',
//     ),
//     Category(
//       Color(0xffF123C4),
//       Color(0xff668CEA),
//       'Appliances',
//       'assets/jeans_5.png',
//     ),
//   ];

//   final TabController tabController;

//   TabView({super.key, required this.tabController});

//   @override
//   Widget build(BuildContext context) {
//     return TabBarView(
//       physics: NeverScrollableScrollPhysics(),
//       controller: tabController,
//       children: [
//         Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             SizedBox(height: 16.0),
//             Flexible(child: RecommendedList()),
//           ],
//         ),
//         Column(
//           children: <Widget>[
//             SizedBox(height: 16.0),
//             Flexible(child: RecommendedList()),
//           ],
//         ),
//         Column(
//           children: <Widget>[
//             SizedBox(height: 16.0),
//             Flexible(child: RecommendedList()),
//           ],
//         ),
//         Column(
//           children: <Widget>[
//             SizedBox(height: 16.0),
//             Flexible(child: RecommendedList()),
//           ],
//         ),
//         Column(
//           children: <Widget>[
//             SizedBox(height: 16.0),
//             Flexible(child: RecommendedList()),
//           ],
//         ),
//       ],
//     );
//   }
// }
