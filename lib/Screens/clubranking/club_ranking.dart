import 'package:brawlstar/Constants/colors.dart';
import 'package:brawlstar/Screens/club/club_detail.dart';
import 'package:brawlstar/Services/RankingClub.dart';
import 'package:brawlstar/Services/iconapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hash_cached_image/hash_cached_image.dart';

class ClubRanking extends HookWidget {
  const ClubRanking({super.key});



  @override
  Widget build(BuildContext context) {

    final iconsdata = useMemoized(() => iconAPI1.fetchicon());
    final icons = useFuture(iconsdata);

    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme:IconThemeData(color: bordercolor),
        title: Text("Club Ranking",style: GoogleFonts.acme(color: bordercolor,fontSize: 25)),
      ),
      body: SafeArea(
          child: FutureBuilder(
            future: RankingClubApi().getrankingclubapi(),
            builder: (context, snapshot) {
              if(snapshot.hasData)
              {
                return ListView.builder(
                  itemCount: RankingClubApi.list.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
                              return ClubDetail(clubTag: RankingClubApi.list[index]['tag'],);
                            },));
                          },

                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                            child: Container(
                              height: (MediaQuery.of(context).size.height * 0.18),
                              decoration: BoxDecoration(
                                  color: cntcolor,
                                  border: Border.all(
                                      color: bordercolor,
                                      width: 5
                                  )
                              ),
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
                                    child: Center(child: Text("${RankingClubApi.list[index]['rank']}",style: GoogleFonts.acme(fontSize: 30),)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      child:
                                      icons.data!['club']['${RankingClubApi.list[index]['badgeId']}'] != null
                                          ? Center(
                                        child: HashCachedImage(
                                            imageUrl: icons.data!['club']['${RankingClubApi.list[index]['badgeId']}']
                                            ['imageUrl']),
                                      )
                                          : const SizedBox.shrink()
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "${RankingClubApi.list[index]['name']}",overflow: TextOverflow.ellipsis,style: GoogleFonts.acme(fontSize: 25,),
                                            ),
                                          Row(
                                            children: [
                                              Center(
                                                child: Container(
                                                  height: 25,
                                                  width: 30,
                                                  child: Image.asset("Asserts/images/rank.png"),
                                                ),
                                              ),
                                              Container(
                                                child: Text("${RankingClubApi.list[index]['trophies']}",style: GoogleFonts.acme(fontSize: 20),),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("Members : ",style: GoogleFonts.acme(fontSize: 20),),
                                              Text("${RankingClubApi.list[index]['memberCount']}/30",style: GoogleFonts.acme(fontSize: 20),)
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Column(
                                  //   children: [
                                  //     Container(
                                  //       child: Text("Members"),
                                  //     )
                                  //   ],
                                  // )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
              } else if(snapshot.hasError)
              {
                return Center(child: Text("${snapshot.error}"));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}


