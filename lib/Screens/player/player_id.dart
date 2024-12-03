import 'package:brawlstar/Constants/colors.dart';
import 'package:brawlstar/Screens/player/player_detail.dart';
import 'package:brawlstar/Services/player_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerId extends StatefulWidget {
  const PlayerId({super.key});

  @override
  State<PlayerId> createState() => _PlayerIdState();
}

class _PlayerIdState extends State<PlayerId> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayerController>(
      init: PlayerController(),
      builder: (ctr){
        return Scaffold(
          backgroundColor: bgcolor,

          appBar: AppBar(
            title: Text("Player ID",style: GoogleFonts.acme(color: bordercolor,fontSize: 25),),
            iconTheme:IconThemeData(color: bordercolor),
            backgroundColor: Colors.transparent,
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
                    controller: ctr.playerId,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.acme(color: Colors.black,fontSize: 25),
                    decoration: InputDecoration(
                      fillColor: cntcolor,
                      filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: bordercolor,width: 4),
                        ),
                      hintText: "Your Player ID",
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
                      return PlayerDetail(playerTag:ctr.playerId.text);
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
      },
    );
  }
}
