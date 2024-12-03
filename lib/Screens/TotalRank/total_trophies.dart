import 'package:brawlstar/Constants/colors.dart';
import 'package:brawlstar/Screens/player/player_detail.dart';
import 'package:brawlstar/Services/RankingTotalTrophies.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:brawlstar/Services/iconapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hash_cached_image/hash_cached_image.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class TotalTrophies extends StatefulWidget {
  const TotalTrophies({super.key});

  @override
  State<TotalTrophies> createState() => _TotalTrophiesState();
}

class _TotalTrophiesState extends State<TotalTrophies> {

  Map<String,dynamic>? icons;
  List allicon=[];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchIcons();
  }

  Future<void> fetchIcons() async {
    final response = await http.get(Uri.parse('https://api.brawlify.com/v1/icons'));

    if (response.statusCode == 200) {
      setState(() {
        icons = json.decode(response.body);
        allicon.add(icons!['player']);
        allicon.add(icons!['club']);
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load icons');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme:IconThemeData(color: bordercolor),
        title: Text("Total Trophies",style: GoogleFonts.acme(color: bordercolor,fontSize: 25)),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: RankingTotalTrophiesApi().getrankingtotaltrophiesapi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: RankingTotalTrophiesApi.list.length,
                itemBuilder: (context, index) {
                  // var data = RankingTotalTrophiesApi.list;
                  // print(data);
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return PlayerDetail(playerTag: RankingTotalTrophiesApi
                              .list[index]['tag']);
                        },));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Container(
                        height: (MediaQuery.of(context).size.height * 0.18),
                          decoration: BoxDecoration(
                              color: cntcolor,
                              border: Border.all(color: bordercolor, width: 5)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 50,
                                decoration: BoxDecoration(
                                    border: BorderDirectional(
                                        end: BorderSide(
                                            color: bordercolor,width: 5
                                        )
                                    )
                                ),
                                child: Center(child: Text( "${RankingTotalTrophiesApi
                                    .list[index]['rank']}",style: GoogleFonts.acme(fontSize: 30),)),
                              ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 70,
                                width: 70,
                                child:
                                allicon[0]['${RankingTotalTrophiesApi.list[index]['icon']['id']}'] != null
                                    ? Center(
                                    child: HashCachedImage(
                                        imageUrl: allicon[0]
                                        ['${RankingTotalTrophiesApi.list[index]['icon']['id']}']
                                        ['imageUrl']))
                                    : const SizedBox.shrink(),
                              ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${RankingTotalTrophiesApi.list[index]['name']}",overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.acme(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color(int.parse(
                                        "${RankingTotalTrophiesApi
                                            .list[index]['nameColor']}"))),
                              ),
                              Text(
                                "${RankingTotalTrophiesApi.list[index]['club'] ==
                                    null ? "" : RankingTotalTrophiesApi
                                    .list[index]['club']['name']}",overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.acme(fontSize: 20),),
                              Row(
                                children: [
                                  Container(
                                    height: 25,
                                    width: 30,
                                    child: Image.asset(
                                        "Asserts/images/rank.png"),
                                  ),
                                  Text("${RankingTotalTrophiesApi
                                      .list[index]['trophies']}",overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.acme(fontSize: 20),)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                    ],
                  ),)
                  ,
                  )
                  ,
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  // Future fetchIcons() async{
  //   iconModel response=await iconAPI.fetchIcons();
  //
  //   setState(() {
  //     icondata  =response;
  //   });
  //
  // }
  // iconAPI1.fetchicon(
  // Future fetchIcons() async {
  //   var response = await iconAPI1.fetchicon();
  //
  //   setState(() {
  //     icons = response;
  //   });
  // }

}
