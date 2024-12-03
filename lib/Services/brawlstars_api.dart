import 'dart:convert';
import '../Models/Brawlers/brawler.dart';
import 'package:http/http.dart' as http;


class BrawlstarsApi {
  static Future<List<Brawler>> fethBrawler() async {
    print("Api call");
    const url = 'https://api.brawlify.com/v1/brawlers';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    print("json data");
    print(json);
    final result = json['list'] as List<dynamic>;
    //  List result = json['list'] ;



    // Brawler data =  Brawler.fromJson(result as Map<String, dynamic>);

    List<Brawler> brawlers=result.map((e) {
      return Brawler.fromJson(e as Map<String,dynamic>);
    },).toList();
    return brawlers;
    // print("result");
    // print(Brawlers);

    // final finalresult=result.map(b){
    //   return Brawler(
    //
    //   )
    // }
  }
}
