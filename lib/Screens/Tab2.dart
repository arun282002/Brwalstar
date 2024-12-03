import 'package:brawlstar/Models/Events/Events.dart';
import 'package:brawlstar/Screens/Tab2Details.dart';
import 'package:brawlstar/Services/events_api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class tab2 extends StatefulWidget {
  const tab2({super.key});

  @override
  State<tab2> createState() => _tab2State();
}

class _tab2State extends State<tab2> {
  BrawlifyResponse? brawlifyResponse;
  bool isloding = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffb9e4c9),
      body: Scaffold(
          backgroundColor: Color(0xffb9e4c9),
          body: isloding
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: brawlifyResponse?.upcoming.length,
                    itemBuilder: (context, index) {
                      // final activdata = brawlifyResponse!.active[index];
                      final upcoming = brawlifyResponse!.upcoming[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Tab2details(
                                mapdata: upcoming.map,
                                mapstatus: upcoming.map.stats,
                              );
                            },
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                  top: BorderSide(
                                    color: Color(0xff356859),
                                    width: 3,
                                  ),
                                  start: BorderSide(
                                    color: Color(0xff356859),
                                    width: 3,
                                  ),
                                  end: BorderSide(
                                    color: Color(0xff356859),
                                    width: 3,
                                  ),
                                ),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                            child: Stack(
                              children: [
                                Container(
                                  height: 150,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              upcoming.map.environment.imageUrl),
                                          fit: BoxFit.cover)),
                                ),
                                Positioned(
                                  top: 125,
                                  child: Container(
                                      height: 70,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage("Asserts/images/hori4.png"),fit: BoxFit.cover)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(upcoming.map.name,style: GoogleFonts.acme(fontWeight: FontWeight.bold,fontSize: 25,color: Color(0xffb9e4c9)),),
                                      )
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
    );
  }

  Future<void> fetchEvents() async {
    BrawlifyResponse response = await EventsApi.fetchEvents();

    setState(() {
      isloding = false;
      brawlifyResponse = response;
    });
    // print(events);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isloding = true;
    });
    fetchEvents();
  }
}
