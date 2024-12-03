import 'package:brawlstar/Constants/colors.dart';
import 'package:brawlstar/Screens/Tab1.dart';
import 'package:brawlstar/Screens/Tab2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class eventScreen extends StatefulWidget {
  const eventScreen({super.key});

  @override
  State<eventScreen> createState() => _eventScreenState();
}

class _eventScreenState extends State<eventScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool isloading=false;
  Color? backgroundColor;

  // Future<void> fetchdata() async {
  //   setState(() {
  //     isloading=true;
  //   });
  //
  //   // await Future.delayed(Duration(seconds: 2));
  //   //
  //   // setState(() {
  //   //   isloading = false;
  //   // });
  // }
  @override
  initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();

    // fetchdata();
  }

  @override
  dispose() {
    tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffb9e4c9),
      appBar: AppBar(
        iconTheme:IconThemeData(color: bordercolor),
        title: Text("Events",style: GoogleFonts.acme(color: bordercolor,fontSize: 25)),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xff379570),
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TabBar(
                          controller: tabController,
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          dividerColor: Colors.transparent,
                          // indicatorColor: Colors.yellowAccent,
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                                width: 5.0, color: Color(0xff356859)),
                            insets: EdgeInsets.symmetric(horizontal: 90.0),
                          ),
                          tabs: [
                            Tab(
                              child: Text("Active",
                                  style: GoogleFonts.acme(fontSize: 18)),
                            ),
                            Tab(
                              child: Text(
                                "Deactive",
                                style: GoogleFonts.acme(fontSize: 18),
                              ),
                            ),
                          ]),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: isloading?Center(child: CircularProgressIndicator()):TabBarView(
                    controller: tabController,
                    children: [
                      tab1(),
                      tab2(),
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
