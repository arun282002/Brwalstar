import 'package:brawlstar/Screens/TotalRank/total_trophies.dart';
import 'package:brawlstar/Screens/brawlerrank/brawlers_ranking.dart';
import 'package:brawlstar/Screens/brawlersscreen.dart';
import 'package:brawlstar/Screens/club/club_id.dart';
import 'package:brawlstar/Screens/clubranking/club_ranking.dart';
import 'package:brawlstar/Screens/eventScreen.dart';
import 'package:brawlstar/Screens/player/player_id.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<Map<String, dynamic>> gridItems = [
    {'title': 'PLAYER', 'page': PlayerId()},
    {'title': 'CLUB', 'page': ClubId()},
    {'title': 'BRAWLER', 'page': Brawlersscreen()},
    {'title': 'TOTAL \n RANK', 'page': TotalTrophies()},
    {'title': 'CLUB \n RANK', 'page': ClubRanking()},
    {'title': 'BRAWLER \n RANK', 'page': BrawlersRanking()},
    {'title': 'EVENT', 'page': eventScreen()},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffb9e4c9),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Home Screen"),
        ),
        body:gridItems.isEmpty?Center(child: CircularProgressIndicator(),): Container(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent:200,
                crossAxisCount: 1
              ),itemCount: gridItems.length, itemBuilder: (context, index) {
                final items=gridItems[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return items['page'];
                      },
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xff379570),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                                items['title'],textAlign: TextAlign.center,
                                style: GoogleFonts.acme(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                          ),

                          Positioned(
                            bottom: -20,
                            left: -20,
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10,
                                    // spreadRadius: 5
                                  )
                                ],
                                color: Color(0xff356859),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Positioned(
                            top: -20,
                            right: -20,
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10,
                                    // spreadRadius: 5
                                  )
                                ],
                                color: Color(0xff356859),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },),
        ));
  }
}
