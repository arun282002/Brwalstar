import 'package:brawlstar/Constants/colors.dart';
import 'package:brawlstar/Screens/player/player_detail.dart';
import 'package:brawlstar/Services/ClubApi.dart';
import 'package:brawlstar/Services/iconapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hash_cached_image/hash_cached_image.dart';

class ClubDetail extends HookWidget {
  final String clubTag;

  const ClubDetail({super.key, required this.clubTag});

  @override
  Widget build(BuildContext context) {
    var clubDetail = useState({});

    final iconsdata = useMemoized(() => iconAPI1.fetchicon());
    final icons = useFuture(iconsdata);

    useEffect(() {
      ClubApi().getclubapi(clubTag).then((value) {
        if (value['reason'] == "notFound") {
          Fluttertoast.showToast(
              msg: "Club not found",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: bgcolor,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.pop(context);
        } else {
          clubDetail.value = Map.from(value);
        }
      });
      return () {};
    }, []);

    return Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme:IconThemeData(color: bordercolor),
          title: Text("Club Detail",style: GoogleFonts.acme(color: bordercolor,fontSize: 25),),
        ),
        body: clubDetail.value.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: cntcolor,
                            border: Border.all(color: bordercolor, width: 5)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              icons.hasData
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 70,
                                        width: 70,
                                        child:
                                        Builder(
                                          builder: (context) {
                                            for (var club in icons
                                                .data!['club'].values) {
                                              if (club['id'].toString() ==
                                                  clubDetail.value['badgeId']
                                                      .toString()) {
                                                return Image.network(
                                                  club['imageUrl'],
                                                  fit: BoxFit.cover,
                                                );
                                              }
                                            }
                                            return Container(); // Return an empty container if no match found
                                          },
                                        ),
                                      ),
                                    )
                                  : Container(),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        clubDetail.value['name'],overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.acme(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
                                      ),
                                      Text(clubDetail.value['tag'],
                                          style: TextStyle(color: Colors.white, fontSize: 20)),
                                      // Text(clubDetail.value['description'].toString(),style: GoogleFonts.acme(fontSize: 25,fontWeight: FontWeight.bold,),)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
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
                                      image: AssetImage("Asserts/images/borderbanner1.png")
                                  )
                              ),
                              child: Center(child: Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Text("INFO",style: GoogleFonts.acme(color: bordercolor,fontWeight: FontWeight.bold, fontSize: 30),),
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Trophies",
                                    style: GoogleFonts.acme(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    "${clubDetail.value['trophies']}",
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
                                    "Required Trophies",
                                    style: GoogleFonts.acme(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    "${clubDetail.value['requiredTrophies']}",
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
                                    "Type",
                                    style: GoogleFonts.acme(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    "${clubDetail.value['type']}",
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
                                    "Members",
                                    style: GoogleFonts.acme(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    "${clubDetail.value['members'].length}/30",
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
                            border: Border.all(color: bordercolor, width: 5)),
                        child: Column(
                          children: [
                            Container(
                              height: 73,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("Asserts/images/borderbanner1.png")
                                  )
                              ),
                              child: Center(child: Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Text("PLAYERS",style: GoogleFonts.acme(color: bordercolor,fontWeight: FontWeight.bold, fontSize: 30),),
                              )),
                            ),
                            ListView.builder(
                              itemCount: clubDetail.value['members'].length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                // print("Club tag");
                                // print(clubDetail.value);
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(
                                      builder: (context) {
                                        return PlayerDetail(
                                            playerTag:
                                                clubDetail.value['members']
                                                    [index]['tag']);
                                      },
                                    ));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: BorderDirectional(
                                            bottom: BorderSide(
                                                color: bordercolor, width: 5))),
                                    child: Row(
                                      children: [
                                        Container(
                                          // height: double.infinity,
                                          height: 120,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              border: BorderDirectional(
                                                  end: BorderSide(
                                                      color: bordercolor,
                                                      width: 5))),
                                          child: Center(
                                              child: Text(
                                            "${index + 1}",
                                            style:
                                                GoogleFonts.acme(fontSize: 30),
                                          )),
                                        ),
                                        
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 80,
                                            width: 80,
                                            child:
                                            icons.data!['player']['${clubDetail.value['members'][index]['icon']['id']}'] != null
                                                ? Center(
                                                child: HashCachedImage(
                                                    imageUrl: icons.data!['player']
                                                    ['${clubDetail.value['members'][index]['icon']['id']}']
                                                    ['imageUrl'],fit: BoxFit.cover,))
                                                : const SizedBox.shrink(),

                                            // Builder(
                                            //   builder: (context) {
                                            //     for (var club in icons.data!['club'].values) {
                                            //       if(club['id'].toString() == clubDetail.value['members'][index]['icon']['id'].toString()) {
                                            //          Image.network(
                                            //            club['imageUrl'],
                                            //           fit: BoxFit.cover,
                                            //         );
                                            //       }
                                            //     }
                                            //     return Center(child: CircularProgressIndicator(color: Colors.grey,)); // Return an empty container if no match found
                                            //   },
                                            // ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "${clubDetail.value['members'][index]['name']}",overflow: TextOverflow.ellipsis,
                                                    style: GoogleFonts.acme(
                                                      fontSize: 25,
                                                      fontWeight: FontWeight.bold,
                                                      color: Color(int.parse(
                                                          "${clubDetail.value['members'][index]['nameColor']}")),
                                                    )),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 25,
                                                      width: 30,
                                                      child: Image.asset(
                                                          "Asserts/images/rank.png"),
                                                    ),
                                                    Text(
                                                      "${clubDetail.value['members'][index]['trophies']}",
                                                      style: GoogleFonts.acme(
                                                        fontSize: 20,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ));

    //
    // // TODO: implement build
    // throw UnimplementedError();
  }
}
