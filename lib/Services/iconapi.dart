import 'dart:convert';

import 'package:brawlstar/Models/Icon/icon.dart';
import 'package:http/http.dart' as http;

// class iconAPI{
//   static Future<iconModel> fetchIcons() async{
//     final uri=Uri.parse('https://api.brawlify.com/v1/icons');
//     final response=await http.get(uri);
//
//     final jsondata=jsonDecode(response.body);
//
//     return jsondata;
//   }
// }

class iconAPI1{
  static Future<Map<String, dynamic>> fetchicon() async{
    var url = Uri.parse('https://api.brawlify.com/v1/icons');
    var response = await http.get(Uri.parse('https://api.brawlify.com/v1/icons'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }

    // var result=jsonDecode(response.body);
    // return result;
  }
}