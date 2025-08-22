import 'package:inefable_shop/repositories/api_repository.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  // final dio = Dio();
  // static const String tokenInstagram =
  //     "IGQWRNUUtkY1RKY3BtNGFyNWhwaGprUFVsemlwOE5hN1ZAnbzN5eGJaQTZAQTmFoSTdyeHRwYnhNV3phUFBkQWl2bmZAqZAlMxNnhrbDBKbTQtSWlSMnlUUHpPcnE3by1HY1hhQ01iUWcwWDNrdwZDZD";
  // @override
  // Future<InstagramMediaId> getInstagramMediaId() async {
  //   try {
  //     final response = await dio.get(
  //       "https://graph.instagram.com/me/media?fields=id,caption,media_type,media_url,timestamp,permalink,thumbnail_url&access_token=$tokenInstagram",
  //     );

  //     InstagramMediaId data = InstagramMediaId.fromJson(response.data);
  //     return data;
  //   } catch (e) {
  //     throw UnimplementedError(e.toString());
  //   }
  // }

  // @override
  // Future<InstagramAlbumCollection> getInstagramAlbum(String value) async {
  //   try {
  //     final response = await dio.get(
  //       "https://graph.instagram.com/$value/children?access_token=$tokenInstagram&fields=media_url",
  //     );

  //     InstagramAlbumCollection data =
  //         InstagramAlbumCollection.fromJson(response.data);
  //     return data;
  //   } catch (e) {
  //     throw UnimplementedError(e.toString());
  //   }
  // }

  // @override
  // Future<InstagramMediaId> getNextInstagramMediaId(String value) async {
  //   try {
  //     final response = await dio.get(
  //       value,
  //     );

  //     InstagramMediaId data = InstagramMediaId.fromJson(response.data);
  //     return data;
  //   } catch (e) {
  //     throw UnimplementedError(e.toString());
  //   }
  // }
}

// void getHttp() async {
//   final response = await dio.get('https://dart.dev');
//   print(response);
// }
// Future<void> fetchProvinces() async {
//     try {
//       var uri = Uri.parse(
//           'https://www.emsifa.com/api-wilayah-indonesia/api/provinces.json');
//       var response = await http.get(uri);

//       if (response.statusCode == 200) {
//         List<dynamic> data = json.decode(response.body);
//         provinces
//             .assignAll(data.map((json) => Province.fromJson(json)).toList());
//       }
//     } catch (e) {
//       print('Failed to load provinces. Status code: $e');
//     }
//   }

// Future<List<ProductModel>> getAllProduct() async {
//     try {
//       final document = ref.collection('product');
//       final querySnapshot = await document.get();

//       List<ProductModel> products = [];

//       for (var doc in querySnapshot.docs) {
//         ProductModel product = ProductModel.fromFirestore(doc.data());
//         products.add(product);
//       }
//       return products;
//     } catch (e) {
//       throw UnimplementedError(e.toString());
//     }
//   }
