import 'dart:convert';
import 'package:http/http.dart' as http;

class RankingBrawlerApi{

  static var list1;
  static List list=[];

  Future getrankingbrawlerapi(rankingbrawlerid) async{
    int rankingbrawlerids = rankingbrawlerid;

    var body={
      "type":"get",
      "url": "https://api.brawlstars.com/v1/rankings/global/brawlers/$rankingbrawlerids"
    };

    var url = Uri.parse('https://supercellapi.miracocopepsi.com/api/brawlCall');
    var response = await http.post(url, body: body);

    list1=jsonDecode(response.body);
    list=[];

    for(int i=0;i<list1['items'].length;i++)
      {
        list.add(list1['items'][i]);
      }
    return list;
  }
}