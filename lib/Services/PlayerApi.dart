import 'dart:convert';

import 'package:http/http.dart' as http;

class PlayerApi{
  static Map list={};

  Future getplayerapi(playerid) async{
    String playerId0="";

    if(playerid.startsWith('#')){
      playerId0=playerid.substring(1,playerid.length);
    }
    else
      {
        playerId0=playerid;
      }

    var body={
      "type":"get",
      "url":"https://api.brawlstars.com/v1/players/%23$playerId0"
    };

    var url=Uri.parse('https://supercellapi.miracocopepsi.com/api/brawlCall');
    var response=await http.post(url,body:body);
    print(response);
    list=jsonDecode(response.body);
    print(list);

    return list;
  }
}
