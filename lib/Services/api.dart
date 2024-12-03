// import 'package:brawl_star_getx/BSStatsAds/BSStatsAdsMainJson/BSStatsAdsMainJson.dart';
// import 'package:brawl_star_getx/BSStatsAds/BSStatsAdsUtils/BSStatsAdsExtensions.dart';
// import 'package:dio/dio.dart';
// import 'package:provider/provider.dart';
//
// import '../BSStatsAds/BSStatsAdsUtils/NavigationService.dart';
//
// class Api {
//   static final Api _singleton = Api._internal();
//
//   factory Api() {
//     return _singleton;
//   }
//
//   Api._internal();
//
//   List icon = [];
//   List brawler = [];
//   List brawlifyBrawler = [];
//   Map event = {};
//   List map = [];
//
//   Future getIcon() async {
//     var response = await Dio().get(
//       "${NavigationService.navigatorKey.currentContext!.read<BSStatsMainJson>().data!['assets']['iconJson']}".decrypt(),
//       options: Options(
//         receiveDataWhenStatusError: true,
//         receiveTimeout: const Duration(minutes: 1),
//       ),
//     );
//     if (response.data != null) {
//       var icon1 = response.data;
//       icon.add(icon1['player']);
//       icon.add(icon1['club']);
//       print("icon");
//     }
//   }
//
//   Future getBrawler() async {
//     var response = await Dio().get(
//       "${NavigationService.navigatorKey.currentContext!.read<BSStatsMainJson>().data!['assets']['brawlerJson']}"
//           .decrypt(),
//       options: Options(
//         receiveDataWhenStatusError: true,
//         receiveTimeout: const Duration(minutes: 1),
//       ),
//     );
//     if (response.data != null) {
//       brawler = response.data!['brawler'];
//     }
//     print("brawler");
//   }
//
//   Future getBrawlifyBrawler() async {
//     var response = await Dio().get(
//       "${NavigationService.navigatorKey.currentContext!.read<BSStatsMainJson>().data!['assets']['brawlifybrawlerJson']}"
//           .decrypt(),
//       options: Options(
//         receiveDataWhenStatusError: true,
//         receiveTimeout: const Duration(minutes: 1),
//       ),
//     );
//     if (response.data != null) {
//       brawlifyBrawler = response.data!['list'];
//       print("brawlifyBrawler");
//     }
//   }
//
//   Future getEvent() async {
//     var response = await Dio().get(
//       "${NavigationService.navigatorKey.currentContext!.read<BSStatsMainJson>().data!['assets']['eventJson']}"
//           .decrypt(),
//       options: Options(
//         receiveDataWhenStatusError: true,
//         receiveTimeout: const Duration(minutes: 1),
//       ),
//     );
//     if (response.data != null) {
//       event = response.data;
//       print("event");
//     }
//   }
//
//   Future getMap() async {
//     var response = await Dio().get(
//       "${NavigationService.navigatorKey.currentContext!.read<BSStatsMainJson>().data!['assets']['mapJson']}".decrypt(),
//       options: Options(
//         receiveDataWhenStatusError: true,
//         receiveTimeout: const Duration(minutes: 1),
//       ),
//     );
//     if (response.data != null) {
//       map = response.data!['list'];
//       print("map");
//     }
//   }
// }
