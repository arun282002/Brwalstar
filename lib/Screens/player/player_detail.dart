import 'package:brawlstar/Constants/colors.dart';
import 'package:brawlstar/Models/Brawlers/brawler.dart';
import 'package:brawlstar/Models/Icon/icon.dart';
import 'package:brawlstar/Screens/player/player_brawler_detail.dart';
import 'package:brawlstar/Services/PlayerApi.dart';
import 'package:brawlstar/Services/ad_gridview.dart';
import 'package:brawlstar/Services/brawlstars_api.dart';
import 'package:brawlstar/Services/iconapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hash_cached_image/hash_cached_image.dart';

class PlayerDetail extends HookWidget {
  final String playerTag;

  const PlayerDetail({super.key, required this.playerTag});

  @override
  Widget build(BuildContext context) {
    final iconsdata = useMemoized(() => iconAPI1.fetchicon());
    final icons = useFuture(iconsdata);
    print(icons);

    var Brawlers = useState<List<Brawler>>([]);
    var playerDetail = useState({});

    useEffect(() {
      PlayerApi().getplayerapi(playerTag).then(
        (value) {
          if (value['reason'] == "notFound") {
            Fluttertoast.showToast(
                msg: "Player not found",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: bgcolor,
                textColor: Colors.white,
                fontSize: 15);
            Navigator.pop(context);
          } else {
            playerDetail.value = Map.from(value);
          }
        },
      );
      return () {};
    }, []);

    Future<void> fethBrawler() async {
      List<Brawler> response = await BrawlstarsApi.fethBrawler();
      Brawlers.value = response;
      // print("final data");
      // print(Brawlers);
    }

    useEffect(
      () {
        fethBrawler();
        // fetchicons();
        return null;
      },
    );

    return Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: bordercolor),
          title: Text(
            "Player Detail",
            style: GoogleFonts.acme(color: bordercolor, fontSize: 25),
          ),
        ),
        body: playerDetail.value.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: cntcolor,
                            border: Border.all(color: bordercolor, width: 5)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 70,
                                width: 70,
                                child: Builder(
                                  builder: (context) {
                                    for (var player
                                        in icons.data!['player'].values) {
                                      if (player['id'].toString() ==
                                          playerDetail.value['icon']['id']
                                              .toString()) {
                                        return Image.network(
                                          player['imageUrl'],
                                          fit: BoxFit.cover,
                                        );
                                      }
                                    }
                                    return Center(
                                        child:
                                            CircularProgressIndicator()); // Return an empty container if no match found
                                  },
                                ),
                              ),
                            ),

                            // icons.hasData?
                            //     Padding(
                            //       padding: const EdgeInsets.all(8.0),
                            //       child: Container(
                            //         height: 70,
                            //         width: 70,
                            //         child:
                            //         for(var player in icons.data!['player'].values)
                            //           if(player['id'].toString()==playerDetail.value['icon']['id'].toString())
                            //           Image.network(player['imageUrl'],fit: BoxFit.cover,)
                            //       ),
                            //     ):Container(),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    playerDetail.value['name'],
                                    style: GoogleFonts.acme(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Color(int.parse(
                                            "${playerDetail.value['nameColor']}"))),
                                  ),
                                  Text(
                                    playerDetail.value['tag'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: cntcolor,
                            border: Border.all(color: bordercolor, width: 5)),
                        child: Column(
                          children: [
                            Container(
                              height: 73,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "Asserts/images/borderbanner1.png"))),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Text(
                                  "STATS",
                                  style: GoogleFonts.acme(
                                      color: bordercolor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                              )),
                            ),
                            // Container(
                            //   height: 150,
                            //     width: double.infinity,
                            //     decoration: BoxDecoration(image: DecorationImage(
                            //       image: AssetImage(
                            //         "Asserts/images/borderbanner.png"
                            //       )
                            //     ),
                            //         border: BorderDirectional(
                            //             bottom: BorderSide(
                            //                 color: bordercolor, width: 5))),
                            //     child: Text("Stats"),
                            //     // Center(
                            //     //     child: Text(
                            //     //   "Stats",
                            //     //   style: GoogleFonts.acme(
                            //     //       color: bgcolor, fontSize: 35),
                            //     // ))
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Club",
                                    style: GoogleFonts.acme(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    playerDetail.value['club']['name'],
                                    style: GoogleFonts.acme(fontSize: 25),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Trophies",
                                    style: GoogleFonts.acme(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    "${playerDetail.value['trophies']}",
                                    style: GoogleFonts.acme(fontSize: 25),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Highest Trophies",
                                    style: GoogleFonts.acme(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    "${playerDetail.value['highestTrophies']}",
                                    style: GoogleFonts.acme(fontSize: 25),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Level",
                                    style: GoogleFonts.acme(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    "${playerDetail.value['expLevel']}",
                                    style: GoogleFonts.acme(fontSize: 25),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: cntcolor,
                          border: Border.all(
                            color: bordercolor,
                            width: 5,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 73,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "Asserts/images/borderbanner1.png"))),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Text(
                                  "PERSONAL DETAILS",
                                  style: GoogleFonts.acme(
                                      color: bordercolor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Unlocked Brawlers",
                                    style: GoogleFonts.acme(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    "${playerDetail.value['brawlers'].length}/${Brawlers.value.length}",
                                    style: GoogleFonts.acme(fontSize: 25),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "3 VS 3 Victories",
                                    style: GoogleFonts.acme(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    "${playerDetail.value['3vs3Victories']}",
                                    style: GoogleFonts.acme(fontSize: 25),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Solo Victories",
                                    style: GoogleFonts.acme(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    "${playerDetail.value['soloVictories']}",
                                    style: GoogleFonts.acme(fontSize: 25),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Duo Victories",
                                    style: GoogleFonts.acme(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    "${playerDetail.value['duoVictories']}",
                                    style: GoogleFonts.acme(fontSize: 25),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Robo Rumble",
                                    style: GoogleFonts.acme(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    "${(playerDetail.value['bestRoboRumbleTime'])}",
                                    style: GoogleFonts.acme(fontSize: 25),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: cntcolor,
                          border: Border.all(color: bordercolor, width: 5),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 73,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "Asserts/images/borderbanner1.png"))),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Text(
                                  "BRAWLERS",
                                  style: GoogleFonts.acme(
                                      color: bordercolor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                              )),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            // GridView.builder(
                            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            //       crossAxisCount: 3,mainAxisSpacing: 5,crossAxisSpacing: 5,
                            //     ),
                            //     itemCount: playerDetail.value['brawlers'].length,
                            //     itemBuilder: (context, index) {
                            //       return Brawlers.value[index].id==playerDetail.value['brawlers'][index]['id']
                            //           ? GestureDetector(
                            //         child: Container(
                            //           decoration: BoxDecoration(
                            //             color: cntcolor,
                            //             border: Border.all(color: bgcolor, width: 3),
                            //           ),
                            //           child: Column(
                            //             children: [
                            //               Text(playerDetail.value['brawlers'][index]['name'],style: TextStyle(color: Colors.black),),
                            //               Expanded(child: Image.network(playerDetail.value['brawlers'][index]['image'])),
                            //               // const Spacer()
                            //             ],
                            //           ),
                            //         ),
                            //       )
                            //           : const SizedBox.shrink();
                            //     },
                            // )

                            AdGridView(
                              crossAxisCount: 3,
                              itemCount: playerDetail.value['brawlers'].length,
                              adIndex: 1,
                              itemMainAspectRatio: 1.3 / 1,
                              adWidget: const SizedBox.shrink(),
                              itemWidget: (context, index) {
                                return Brawlers.value.any((element) =>
                                        element.id ==
                                        playerDetail.value['brawlers'][index]
                                            ['id'])
                                    ?
                                    // Brawlers.value[index].id==playerDetail.value['brawlers'][index]['id']
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                            return PlayerBrawlerDetail(playerBrawlerDetail: playerDetail.value['brawlers'][index],);
                                          },));
                                        },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: cntcolor,
                                              border: Border.all(
                                                  color: bgcolor, width: 3),
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
                                                      child: Text(
                                                        playerDetail.value['brawlers']
                                                            [index]['name'],overflow: TextOverflow.ellipsis,
                                                        style: GoogleFonts.acme(fontSize: 18,fontWeight: FontWeight.bold),
                                                      )),
                                                ),
                                                Expanded(
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    child: HashCachedImage(
                                                        imageUrl: Brawlers.value[Brawlers.value
                                                            .indexWhere((element) =>
                                                        element.id ==
                                                            playerDetail.value[
                                                            'brawlers'][index]
                                                            ['id'])].imageUrl),
                                                  ),
                                                ),

                                                // Expanded(
                                                //     child: Image.network(
                                                //         Brawlers.value[Brawlers.value.indexWhere((element) {
                                                //           element['id']==playerDetail.value[
                                                //           'brawlers'][index]
                                                //           ['id']
                                                //         },)])
                                                // ),
                                                // const Spacer()
                                              ],
                                            ),
                                          ),
                                        ),
                                    )
                                    : Center(
                                        child: SizedBox.shrink(),
                                      );
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ));
  }
}
