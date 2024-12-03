import 'dart:convert';

import 'package:brawlstar/Models/Events/Events.dart';
import 'package:http/http.dart' as http;

class EventsApi{
  static Future<BrawlifyResponse> fetchEvents() async{
    final uri=Uri.parse('https://api.brawlify.com/v1/events');
    final response=await http.get(uri);
    final json=jsonDecode(response.body);

    var result = BrawlifyResponse.fromJson(json);
    return result;
    // final activeResult=json as List<dynamic>;
    // final upcomingResult=json['upcoming'] as List<dynamic>;

  // /  List<Event> activeEvents=json.map((e) {
  //     return Event.fromJson(e as Map<String,dynamic>);
  //   },).toList();
  //   return activeEvents;

    // List<Event> upcomingEvents=upcomingResult.map((e) {
    //   return Event.fromJson(e as Map<String,dynamic>);
    // },).toList();
    // return upcomingEvents;

  }
}