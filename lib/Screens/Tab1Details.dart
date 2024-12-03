import 'package:brawlstar/Constants/colors.dart';
import 'package:brawlstar/Models/Brawlers/brawler.dart';
import 'package:brawlstar/Models/Events/Events.dart';
import 'package:brawlstar/Services/brawlstars_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tab1details extends StatefulWidget {
  final MapData mapdata;
  final List<BrawlerStat> mapstatus;

  const Tab1details({super.key, required this.mapdata, required this.mapstatus});

  @override
  State<Tab1details> createState() => _Tab1detailsState();
}

class _Tab1detailsState extends State<Tab1details> {
  List<Brawler> Brawlers = [];
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: bordercolor),
        backgroundColor: Colors.transparent,
        title: Text(widget.mapdata.name, style: GoogleFonts.acme(color: bordercolor, fontSize: 25)),
      ),
      backgroundColor: Color(0xffb9e4c9),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              isloading
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff356859), width: 5),
                    image: DecorationImage(
                        image: NetworkImage(widget.mapdata.imageUrl),
                        fit: BoxFit.cover)),
              ),
              SizedBox(height: 10),
              Text(
                "Map Stats:",
                style: GoogleFonts.acme(color: Colors.black, fontSize: 30),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*.25,
                    child: Column(
                      children: [
                        for (int i = 0; i < Brawlers.length; i++)
                          for (int j = 0; j < widget.mapstatus.length; j++)
                            if (Brawlers[i].id == widget.mapstatus[j].brawler)
                              isloading
                                  ? Center(child: CircularProgressIndicator())
                                  : Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Image.network(Brawlers[i].imageUrl),
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
                              height: MediaQuery.of(context).size.height*.13,
                              decoration: BoxDecoration(
                                  color: Color(0xff379570),
                                  border: Border.all(color: Color(0xff356859), width: 5)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "WIN RATE:   ",
                                          style: GoogleFonts.acme(color: Colors.white, fontSize: 15),
                                        ),
                                        Text(
                                          widget.mapstatus[i].winRate.toString(),
                                          style: GoogleFonts.acme(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "USE RATE:   ",
                                          style: GoogleFonts.acme(color: Colors.white, fontSize: 15),
                                        ),
                                        Text(
                                          widget.mapstatus[i].useRate.toString(),
                                          style: GoogleFonts.acme(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
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
      isloading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fethBrawler();
    isloading = true;
  }
}
