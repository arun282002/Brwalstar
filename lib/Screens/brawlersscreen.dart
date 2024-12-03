import 'dart:convert';

import 'package:brawlstar/Constants/colors.dart';
import 'package:brawlstar/Models/Brawlers/brawler.dart';
import 'package:brawlstar/Screens/Tab1Details.dart';
import 'package:brawlstar/Screens/brawlersscreendetails.dart';
import 'package:brawlstar/Services/brawlstars_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Brawlersscreen extends StatefulWidget {
  const Brawlersscreen({super.key});

  @override
  State<Brawlersscreen> createState() => _BrawlersscreenState();
}

class _BrawlersscreenState extends State<Brawlersscreen> {
  List<Brawler> Brawlers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffb9e4c9),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: bordercolor),
          title: Text("Brawler",
              style: GoogleFonts.acme(color: bordercolor, fontSize: 25)),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: Brawlers.length,
            itemBuilder: (context, index) {
              final brawler = Brawlers[index];
              final name1 = brawler.name;

              final isEven = index % 2 == 0;

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Brawlersscreendetails(
                            gadgets: brawler.gadgets,
                            starpower: brawler.starPowers,
                            indexdata: Brawlers[index]);
                      },
                    ),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: Color(0xff379570),
                          border:
                              Border.all(color: Color(0xff356859), width: 8)),
                      child: isEven
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 140,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                      // color: Colors.black,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "Asserts/images/label31.png"),
                                          fit: BoxFit.cover)),
                                  child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: brawler.imageUrl3.toString() !=null
                                          ? Image.network(
                                              brawler.imageUrl3,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.asset(
                                              "Asserts/images/other.png",
                                              fit: BoxFit.cover,
                                            )),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 20),
                                //   child: Container(
                                //     height: 100,
                                //     width: 100,
                                //     decoration: BoxDecoration(
                                //         // borderRadius:
                                //         //     BorderRadius.circular(50),
                                //         image: DecorationImage(
                                //             image: NetworkImage(
                                //                 brawler.imageUrl3),fit: BoxFit.cover)),
                                //   ),
                                // ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    name1,
                                    style: GoogleFonts.acme(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  name1,
                                  style: GoogleFonts.acme(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                // SizedBox(
                                //   width: 10,
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 20),
                                //   child: Container(
                                //     height: 50,
                                //     width: 50,
                                //     decoration: BoxDecoration(
                                //       image: DecorationImage(
                                //           image: NetworkImage(
                                //               brawler.imageUrl3),fit: BoxFit.cover),
                                //     ),
                                //   ),
                                // ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  width: 140,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                      // color: Colors.black,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "Asserts/images/label41.png"),
                                          fit: BoxFit.cover)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Image.network(
                                      brawler.imageUrl3,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                ),
              );
            },
          ),
        ));
  }

  Future<void> fethBrawler() async {
    List<Brawler> response = await BrawlstarsApi.fethBrawler();
    setState(() {
      Brawlers = response as List<Brawler>;
    });
    print("final data");
    print(Brawlers);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fethBrawler();
  }
}
