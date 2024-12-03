import 'package:brawlstar/Constants/colors.dart';
import 'package:brawlstar/Models/Events/Events.dart';
import 'package:brawlstar/Services/brawlstars_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/Brawlers/brawler.dart';

class Tab2details extends StatefulWidget {
  final MapData mapdata;
  final List<BrawlerStat> mapstatus;
  const Tab2details({super.key, required this.mapdata, required this.mapstatus});

  @override
  State<Tab2details> createState() => _Tab2detailsState();
}

class _Tab2detailsState extends State<Tab2details> {

  List<Brawler> Brawlers = [];
  bool isloding = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme:IconThemeData(color: bordercolor),
        title: Text(widget.mapdata.name,style: GoogleFonts.acme(color: bordercolor,fontSize: 25)),
      ),
      backgroundColor: Color(0xffb9e4c9),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              isloding?Center(child: CircularProgressIndicator(),):Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border.all(
                    color: Color(0xff356859),width: 5
                ),
                    image: DecorationImage(
                        image: NetworkImage(
                            widget.mapdata.imageUrl
                        ),
                        fit: BoxFit.cover
                    )
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Map Stats:",
                style: GoogleFonts.acme(color: Colors.black, fontSize: 25),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isloding?Center(child: CircularProgressIndicator(),):Container(
                    width: 98,
                    child: Column(
                      children: [
                        for (int i = 0; i < Brawlers.length; i++)
                          for (int j = 0; j < widget.mapstatus.length; j++)
                            if (Brawlers[i].id == widget.mapstatus[j].brawler)
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child:isloding?Center(child: CircularProgressIndicator(),): Image.network(Brawlers[i].imageUrl),
                              )
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      children: [
                        for (int i = 0; i < widget.mapstatus.length; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Color(0xff379570),
                                  border: Border.all(
                                      color: Color(0xff356859), width: 5)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "WIN RATE   ",
                                          style: GoogleFonts.acme(
                                              color: Colors.white,fontSize: 15),
                                        ),
                                        Text(
                                          widget.mapstatus[i].winRate.toString(),
                                          style: GoogleFonts.acme(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          )
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "USE RATE   ",
                                          style: GoogleFonts.acme(
                                              color: Colors.white,fontSize: 15),
                                        ),
                                        Text(
                                          widget.mapstatus[i].useRate.toString(),
                                          style: GoogleFonts.acme(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          )
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              // Expanded(
              //   child: ListView.builder(itemCount:widget.mapstatus.length,
              //     itemBuilder: (context, index) {
              //       final indexdata=widget.mapstatus[index];
              //       return Padding(
              //         padding: const EdgeInsets.symmetric(vertical: 5),
              //         child: Container(
              //           decoration: BoxDecoration(
              //               color: Color(0xff379570),border: Border.all(color: Color(0xff356859),width: 5)
              //           ),
              //           child: Column(
              //             children: [
              //               Row(
              //                 children: [
              //                   Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Text("WIN RATE",style: GoogleFonts.abrilFatface(color: Colors.white),),
              //                   ),
              //                   Text(indexdata.winRate.toString(),style: TextStyle(
              //                       fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold
              //                   ),)
              //                 ],
              //               ),
              //               Row(
              //                 children: [
              //                   Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Text("USE RATE",style: GoogleFonts.abrilFatface(color: Colors.white),),
              //                   ),
              //                   Text(indexdata.useRate.toString(),style: TextStyle(
              //                       fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold
              //                   ),)
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ),
              //       );
              //     },),
              // )
                
            ],
          ),
        ),
      ),
    );
  }
  Future<void> fethBrawler() async {
    List<Brawler> response = await BrawlstarsApi.fethBrawler();
    setState(() {
      Brawlers = response as List<Brawler>;
      isloding=false;
    });

  }

  @override
  void initState() {
    super.initState();
    fethBrawler();
    setState(() {
      isloding=true;
    });
  }
}
