import 'package:brawlstar/Constants/colors.dart';
import 'package:brawlstar/Models/Brawlers/brawler.dart';
import 'package:brawlstar/Services/brawlstars_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hash_cached_image/hash_cached_image.dart';

class PlayerBrawlerDetail extends HookWidget {
  final Map playerBrawlerDetail;

  const PlayerBrawlerDetail({super.key, required this.playerBrawlerDetail});


  @override
  Widget build(BuildContext context) {
    var Brawlers = useState<List<Brawler>>([]);

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
        title: Text(playerBrawlerDetail['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                                "BRAWLER STATS",
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
                              "Trophies",
                              style: GoogleFonts.acme(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            Text(
                              "${playerBrawlerDetail['trophies']}",
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
                              "${playerBrawlerDetail['highestTrophies']}",
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
                              "${playerBrawlerDetail['power']}",
                              style: GoogleFonts.acme(fontSize: 25),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 10,),
                playerBrawlerDetail['gadgets'].length != 0
                    ? Container(
                  decoration: BoxDecoration(color: cntcolor,
                      border: Border.all(color: bordercolor, width: 5)),
                  child: Column(
                      children: List.generate(
                        playerBrawlerDetail['gadgets'].length + 1,
                            (index) {
                          return index == 0
                              ? Container(
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
                                    "GADGETS",
                                    style: GoogleFonts.acme(
                                        color: bordercolor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  ),
                                )),
                          ) :
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(height: 50,
                                  width: 40,
                                  child: HashCachedImage(
                                    imageUrl: Brawlers.value[Brawlers.value
                                        .indexWhere((element) =>
                                    element.id ==
                                        playerBrawlerDetail['id'])].gadgets
                                    [Brawlers.value[Brawlers.value
                                        .indexWhere((element) =>
                                    element.id ==
                                        playerBrawlerDetail['id'])].gadgets
                                        .indexWhere((element) =>
                                    element.id ==
                                        playerBrawlerDetail['gadgets'][index -
                                            1]['id'])].imageUrl,
                                    fit: BoxFit.cover,),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    child: Text(
                                      "${playerBrawlerDetail['gadgets'][index -
                                          1]['name']}",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.acme(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),),
                                  ),
                                ),
                              )
                            ],
                          );
                        },)
                  ),
                )
                    : const SizedBox.shrink(),

                SizedBox(height: 10,),
                playerBrawlerDetail['starPowers'].length != 0
                    ? Container(
                  decoration: BoxDecoration(color: cntcolor,
                      border: Border.all(color: bordercolor, width: 5)),
                  child: Column(
                      children: List.generate(
                        playerBrawlerDetail['starPowers'].length + 1,
                            (index) {
                          return index == 0
                              ? Container(
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
                                    "STAR POWERS",
                                    style: GoogleFonts.acme(
                                        color: bordercolor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  ),
                                )),
                          ) :
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    height: 50,
                                    width: 40,
                                    child: HashCachedImage(
                                      imageUrl: Brawlers.value[
                                      Brawlers.value
                                          .indexWhere((element) =>
                                      element.id ==
                                          playerBrawlerDetail['id'])]
                                          .starPowers[Brawlers.value[Brawlers
                                          .value
                                          .indexWhere((element) =>
                                      element.id ==
                                          playerBrawlerDetail['id'])].starPowers
                                          .indexWhere((element) =>
                                      element.id ==
                                          playerBrawlerDetail['starPowers'][index -
                                              1]['id'])].imageUrl!,
                                      fit: BoxFit.cover,)
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    child: Text(
                                      "${playerBrawlerDetail['starPowers'][index -
                                          1]['name']}",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.acme(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),),
                                  ),
                                ),
                              )
                            ],
                          );
                        },)
                  ),
                )
                    : const SizedBox.shrink(),

                SizedBox(height: 10,),
                // playerBrawlerDetail['gears'].length != 0
                //     ? Container(
                //   decoration: BoxDecoration(color: cntcolor,
                //       border: Border.all(color: bordercolor, width: 5)),
                //   child: Column(
                //       children: List.generate(
                //         playerBrawlerDetail['gears'].length + 1,
                //             (index) {
                //           return index == 0
                //               ? Container(
                //             height: 73,
                //             width: double.infinity,
                //             decoration: BoxDecoration(
                //                 image: DecorationImage(
                //                     image: AssetImage(
                //                         "Asserts/images/borderbanner1.png"))),
                //             child: Center(
                //                 child: Padding(
                //                   padding: const EdgeInsets.only(bottom: 12),
                //                   child: Text(
                //                     "GEARS",
                //                     style: GoogleFonts.acme(
                //                         color: bordercolor,
                //                         fontWeight: FontWeight.bold,
                //                         fontSize: 30),
                //                   ),
                //                 )),
                //           ) :
                //           Brawlers.value[Brawlers.value.indexWhere((element) =>
                //           element.id == playerBrawlerDetail['id'])].gadgets.any((element) =>
                //           element.id ==
                //               playerBrawlerDetail['gears'][index - 1]['id'])?
                //           Row(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Container(
                //                     height: 50,
                //                     width: 40,
                //                     child: HashCachedImage(
                //                       imageUrl: Brawlers.value[
                //                       Brawlers.value
                //                           .indexWhere((element) =>
                //                       element.id ==
                //                           playerBrawlerDetail['id'])]
                //                           .gadgets[Brawlers.value[Brawlers
                //                           .value
                //                           .indexWhere((element) =>
                //                       element.id ==
                //                           playerBrawlerDetail['id'])].
                //                           .indexWhere((element) =>
                //                       element.id ==
                //                           playerBrawlerDetail['starPowers'][index -
                //                               1]['id'])].imageUrl!,
                //                       fit: BoxFit.cover,)
                //                 ),
                //               ),
                //               Expanded(
                //                 child: Padding(
                //                   padding: const EdgeInsets.all(15.0),
                //                   child: Container(
                //                     child: Text(
                //                       "${playerBrawlerDetail['starPowers'][index -
                //                           1]['name']}",
                //                       overflow: TextOverflow.ellipsis,
                //                       style: GoogleFonts.acme(
                //                           fontWeight: FontWeight.bold,
                //                           fontSize: 25),),
                //                   ),
                //                 ),
                //               )
                //             ],
                //           );
                //         },)
                //   ),
                // )
                //     : const SizedBox.shrink(),


                // Container(
                //   decoration: BoxDecoration(
                //     color: cntcolor,
                //     border: Border.all(
                //       color: bordercolor,
                //       width: 5,
                //     ),
                //   ),
                //   child: Column(
                //     children: [
                //       Container(
                //         height: 73,
                //         width: double.infinity,
                //         decoration: BoxDecoration(
                //             image: DecorationImage(
                //                 image: AssetImage(
                //                     "Asserts/images/borderbanner1.png"))),
                //         child: Center(
                //             child: Padding(
                //               padding: const EdgeInsets.only(bottom: 12),
                //               child: Text(
                //                 "GADGETS",
                //                 style: GoogleFonts.acme(
                //                     color: bordercolor,
                //                     fontWeight: FontWeight.bold,
                //                     fontSize: 30),
                //               ),
                //             )),
                //       ),
                //
                //
                //
                //       playerBrawlerDetail['gadgets'].length!=0?Container(
                //         child: Row(
                //           children: [
                //
                //           ],
                //         ),
                //       ): const SizedBox.shrink(),
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Row(
                //           mainAxisAlignment:
                //           MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(
                //               "Unlocked Brawlers",
                //               style: GoogleFonts.acme(
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 25),
                //             ),
                //             Text(
                //               "${playerDetail.value['brawlers'].length}/${Brawlers.value.length}",
                //               style: GoogleFonts.acme(fontSize: 25),
                //             )
                //           ],
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Row(
                //           mainAxisAlignment:
                //           MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(
                //               "3 VS 3 Victories",
                //               style: GoogleFonts.acme(
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 25),
                //             ),
                //             Text(
                //               "${playerDetail.value['3vs3Victories']}",
                //               style: GoogleFonts.acme(fontSize: 25),
                //             )
                //           ],
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Row(
                //           mainAxisAlignment:
                //           MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(
                //               "Solo Victories",
                //               style: GoogleFonts.acme(
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 25),
                //             ),
                //             Text(
                //               "${playerDetail.value['soloVictories']}",
                //               style: GoogleFonts.acme(fontSize: 25),
                //             )
                //           ],
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Row(
                //           mainAxisAlignment:
                //           MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(
                //               "Duo Victories",
                //               style: GoogleFonts.acme(
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 25),
                //             ),
                //             Text(
                //               "${playerDetail.value['duoVictories']}",
                //               style: GoogleFonts.acme(fontSize: 25),
                //             )
                //           ],
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Row(
                //           mainAxisAlignment:
                //           MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(
                //               "Robo Rumble",
                //               style: GoogleFonts.acme(
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 25),
                //             ),
                //             Text(
                //               "${(playerDetail.value['bestRoboRumbleTime'])}",
                //               style: GoogleFonts.acme(fontSize: 25),
                //             )
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
