import 'dart:convert';

import 'package:http/http.dart' as http;

class ClubApi {
  static Map list = {};

  Future getclubapi(clubid) async {
    String clubId0 = "";
    if (clubid.startsWith('#')) {
      clubId0 = clubid.substring(1, clubid.length);
    } else {
      clubId0 = clubid;
    }

    var body = {
      "type": "get",
      "url": "https://api.brawlstars.com/v1/clubs/%23$clubId0"
    };

    var url = Uri.parse('https://supercellapi.miracocopepsi.com/api/brawlCall');
    var response = await http.post(url, body: body);
    list = jsonDecode(response.body);

    return list;
  }
}
