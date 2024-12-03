import 'package:brawlstar/Constants/colors.dart';
import 'package:brawlstar/Screens/club/club_detail.dart';
import 'package:brawlstar/Screens/player/player_detail.dart';
import 'package:brawlstar/Services/club_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ClubId extends StatefulWidget {
  const ClubId({super.key});

  @override
  State<ClubId> createState() => _ClubIdState();
}

class _ClubIdState extends State<ClubId> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ClubController(),
      builder: (ctr) {
      return Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
          title: Text("Club ID",style: GoogleFonts.acme(color: bordercolor,fontSize: 25),),
          backgroundColor: Colors.transparent,
          iconTheme:IconThemeData(color: bordercolor),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20  ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: ctr.clubId,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.acme(color: Colors.black,fontSize: 25),
                  decoration: InputDecoration(
                      fillColor: cntcolor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: bordercolor,width: 4),
                      ),
                      hintText: "Your Club ID",
                      hintStyle:GoogleFonts.acme(color: Colors.black,fontSize: 25),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: bordercolor,width: 4)
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, '/playerDetail', arguments: ctr.playerId.text);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return ClubDetail(clubTag:ctr.clubId.text);
                  },));
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: cntcolor,
                      border: Border.all(
                          color: bordercolor,width: 4
                      )
                  ),
                  child: Center(child: Text("Search",style: GoogleFonts.acme(color: Colors.black,fontSize: 25),)),
                ),
              ),

            ],
          ),
        ),
      );
    },);
  }
}
