import 'package:brawlstar/Constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/Brawlers/brawler.dart';

class Brawlersscreendetails extends HookWidget {
  final indexdata;
  final List<Gadget> gadgets;
  final List<StarPower> starpower;


  const Brawlersscreendetails(
      {super.key,
      this.indexdata,
      required this.gadgets,
      required this.starpower
      });



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xffb9e4c9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme:IconThemeData(color: bordercolor),
        title: Text(indexdata.name,style: GoogleFonts.acme(color: bordercolor,fontSize: 25)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0xff379570),
                    border: Border.all(color: Color(0xff356859), width: 5)),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: BorderDirectional(
                              bottom: BorderSide(
                                  color: bordercolor,width: 5
                              )
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(40)),
                                  image: DecorationImage(
                                      image: NetworkImage(indexdata.imageUrl),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Text(
                            indexdata.name,
                            style: GoogleFonts.acme(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(indexdata.description,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                // width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xff379570),
                    border: Border.all(color: Color(0xff356859), width: 5)),
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
                        child: Text("GADGETS",style: GoogleFonts.acme(color: bordercolor,fontWeight: FontWeight.bold, fontSize: 30),),
                      )),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Text(
                    //     "Gadgets",
                    //     style: GoogleFonts.baskervville(
                    //         fontSize: 28, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //       border:
                    //           Border.all(color: Color(0xff356859), width: 3)),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: List.generate(
                         gadgets.length,
                              (index) {
                            final gadgetsdata = gadgets[index];
                            bool isEven = index % 2 == 0;
                            return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: isEven
                                    ? Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    gadgetsdata.imageUrl != null?
                                    Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  gadgetsdata.imageUrl),
                                              fit: BoxFit.cover)),
                                    ):Center(child: CircularProgressIndicator(),),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              gadgetsdata.name,
                                              style:
                                              GoogleFonts.acme(
                                                fontSize: 30,
                                              ),
                                            ),
                                            Text(
                                                gadgetsdata.description,
                                                overflow: TextOverflow.clip,
                                                style:
                                                TextStyle(fontSize: 18,
                                                  fontWeight: FontWeight.bold,)
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                                    : Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(gadgetsdata.name,
                                                style: GoogleFonts
                                                    .acme(
                                                    fontSize: 30)),
                                            Text(gadgetsdata.description,
                                                style: TextStyle(fontSize: 18,
                                                  fontWeight: FontWeight.bold,)
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),gadgetsdata.imageUrl != null?
                                    Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(

                                        // color: Colors.black,
                                          image: DecorationImage(
                                              image:NetworkImage(
                                                  gadgetsdata.imageUrl),
                                              fit: BoxFit.cover)),
                                    ):Center(child: CircularProgressIndicator(),),
                                  ],
                                ));
                          },
                        ),
                      ),
                    ),
                    // Expanded(
                    //   child: ListView.builder(
                    //     itemCount: widget.gadgets.length,
                    //     itemBuilder: (context, index) {
                    //       final gadgetsdata = widget.gadgets[index];
                    //       bool isEven = index % 2 == 0;
                    //       return Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: isEven
                    //               ? Row(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.spaceEvenly,
                    //                   children: [
                    //                     ClipRRect(
                    //                       borderRadius:
                    //                           BorderRadius.circular(50),
                    //                       child: Container(
                    //                         height: 100,
                    //                         width: 100,
                    //                         decoration: BoxDecoration(
                    //                             // color: Color(0xff356859),
                    //                             image: DecorationImage(
                    //                                 image: NetworkImage(
                    //                                     gadgetsdata.imageUrl))),
                    //                       ),
                    //                     ),
                    //                     Expanded(
                    //                       child: Padding(
                    //                         padding: const EdgeInsets.all(8.0),
                    //                         child: Column(
                    //                           crossAxisAlignment:
                    //                               CrossAxisAlignment.start,
                    //                           children: [
                    //                             Text(
                    //                               gadgetsdata.name,
                    //                               style: TextStyle(
                    //                                   fontSize: 20,
                    //                                   fontWeight:
                    //                                       FontWeight.bold),
                    //                             ),
                    //                             Text(
                    //                               gadgetsdata.description,
                    //                               overflow: TextOverflow.clip,
                    //                               style:
                    //                                   TextStyle(fontSize: 16),
                    //                             ),
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     )
                    //                   ],
                    //                 )
                    //               : Row(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.spaceEvenly,
                    //                   children: [
                    //                     Expanded(
                    //                       child: Padding(
                    //                         padding: const EdgeInsets.all(8.0),
                    //                         child: Column(
                    //                           crossAxisAlignment:
                    //                               CrossAxisAlignment.start,
                    //                           children: [
                    //                             Text(
                    //                               gadgetsdata.name,
                    //                               style: TextStyle(
                    //                                   fontSize: 20,
                    //                                   fontWeight:
                    //                                       FontWeight.bold),
                    //                             ),
                    //                             Text(
                    //                               gadgetsdata.description,
                    //                               style: TextStyle(
                    //                                   fontSize: 16,
                    //                                   overflow:
                    //                                       TextOverflow.clip),
                    //                             ),
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     ),
                    //                     ClipRRect(
                    //                       borderRadius:
                    //                           BorderRadius.circular(50),
                    //                       child: Container(
                    //                         height: 100,
                    //                         width: 100,
                    //                         decoration: BoxDecoration(
                    //                             // color: Colors.black,
                    //                             image: DecorationImage(
                    //                                 image: NetworkImage(
                    //                                     gadgetsdata.imageUrl))),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ));
                    //     },
                    //   ),
                    // )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                // width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xff379570),
                    border: Border.all(color: Color(0xff356859), width: 5)),
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
                        child: Text("STAR POWERS",style: GoogleFonts.acme(color: bordercolor,fontWeight: FontWeight.bold, fontSize: 30),),
                      )),
                    ),

                    // Expanded(
                    //   child: ListView.builder(
                    //     itemCount: widget.starpower.length,
                    //     itemBuilder: (context, index) {
                    //       final starpowersdata = widget.starpower[index];
                    //       bool isEven = index % 2 == 0;
                    //       return Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: isEven
                    //               ? Row(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.spaceEvenly,
                    //                   children: [
                    //                     Container(
                    //                       height: 100,
                    //                       width: 100,
                    //                       decoration: BoxDecoration(
                    //                           // color: Color(0xff356859),
                    //                           image: DecorationImage(
                    //                               image: NetworkImage(
                    //                                   starpowersdata
                    //                                       .imageUrl))),
                    //                     ),
                    //                     Expanded(
                    //                       child: Padding(
                    //                         padding: const EdgeInsets.all(8.0),
                    //                         child: Column(
                    //                           crossAxisAlignment:
                    //                               CrossAxisAlignment.start,
                    //                           children: [
                    //                             Text(
                    //                               starpowersdata.name,
                    //                               style: TextStyle(
                    //                                   fontSize: 20,
                    //                                   fontWeight:
                    //                                       FontWeight.bold),
                    //                             ),
                    //                             Text(
                    //                               starpowersdata.description,
                    //                               overflow: TextOverflow.clip,
                    //                               style:
                    //                                   TextStyle(fontSize: 16),
                    //                             ),
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     )
                    //                   ],
                    //                 )
                    //               : Row(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.spaceEvenly,
                    //                   children: [
                    //                     Expanded(
                    //                       child: Padding(
                    //                         padding: const EdgeInsets.all(8.0),
                    //                         child: Column(
                    //                           crossAxisAlignment:
                    //                               CrossAxisAlignment.start,
                    //                           children: [
                    //                             Text(
                    //                               starpowersdata.name,
                    //                               style: TextStyle(
                    //                                   fontSize: 20,
                    //                                   fontWeight:
                    //                                       FontWeight.bold),
                    //                             ),
                    //                             Text(
                    //                               starpowersdata.description,
                    //                               style: TextStyle(
                    //                                   fontSize: 16,
                    //                                   overflow:
                    //                                       TextOverflow.clip),
                    //                             ),
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     ),
                    //                     Container(
                    //                       height: 100,
                    //                       width: 100,
                    //                       decoration: BoxDecoration(
                    //                           // color: Colors.black,
                    //                           image: DecorationImage(
                    //                               image: NetworkImage(
                    //                                   starpowersdata
                    //                                       .imageUrl))),
                    //                     ),
                    //                   ],
                    //                 ));
                    //     },
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: List.generate(
                          starpower.length,
                              (index) {
                            final starpowersdata = starpower[index];
                            bool isEven = index % 2 == 0;
                            return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: isEven
                                    ? Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    starpowersdata
                                        .imageUrl != null?
                                    Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                starpowersdata.imageUrl!),
                                            fit: BoxFit.cover),
                                      ),
                                    ):Center(child: CircularProgressIndicator()),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(starpowersdata.name,
                                                style: GoogleFonts
                                                    .acme(
                                                    fontSize: 30)),
                                            Text(
                                                starpowersdata.description,
                                                overflow: TextOverflow.clip,
                                                style:TextStyle(
                                                    fontSize: 18,fontWeight: FontWeight.bold
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                                    : Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              starpowersdata.name,
                                              style:
                                              GoogleFonts.acme(
                                                  fontSize: 30),
                                            ),
                                            Text(starpowersdata.description,
                                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    starpowersdata
                                        .imageUrl != null?
                                    Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  starpowersdata
                                                      .imageUrl!),
                                              fit: BoxFit.cover)
                                      ),
                                    ):Center(child: CircularProgressIndicator())
                                  ],
                                ));
                          },
                        ),
                      ),
                    ),





                  ],
                ),
              ),
              SizedBox(height: 10,),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //     color: cntcolor,
              //     border: Border.all(
              //       color: bordercolor,width: 5
              //     )
              //   ),
              //   child: Column(
              //     children: [
              //       Container(
              //         height: 73,
              //         width: double.infinity,
              //         decoration: BoxDecoration(
              //             image: DecorationImage(
              //                 image: AssetImage("Asserts/images/borderbanner1.png")
              //             )
              //         ),
              //         child: Center(child: Padding(
              //           padding: const EdgeInsets.only(bottom: 12),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //             Padding(
              //               padding: const EdgeInsets.all(12.0),
              //               child: Text("STATS",
              //                 style: GoogleFonts.acme(color: bordercolor,
              //                     fontWeight: FontWeight.bold, fontSize: 28),),
              //             ),
              //             Row(
              //               children: [
              //                 Text("Level",
              //                   style: GoogleFonts.acme(color: bordercolor,
              //                       fontWeight: FontWeight.bold, fontSize: 30),
              //                 ),
              //                 SizedBox(width: 5,),
              //
              //                 // DropdownMenu<String>(
              //                 //   trailingIcon: ,
              //                 //     textStyle: GoogleFonts.acme(
              //                 //       fontSize: 30,color: bordercolor
              //                 //     ),
              //                 //     initialSelection: selectedValue.value,
              //                 //     onSelected:(String? value) {
              //                 //     selectedValue.value=value!;
              //                 //     },
              //                 //   dropdownMenuEntries: dropdownValue.map<DropdownMenuEntry<String>>((String value) {
              //                 //     return DropdownMenuEntry<String>(value: value, label: value);
              //                 //   }).toList(),
              //                 // ),
              //
              //
              //                 DropdownButton(
              //                   iconEnabledColor: bordercolor,
              //                   dropdownColor: bgcolor,
              //                   value: dropdownValue.value,
              //                   icon: const Icon(Icons.keyboard_arrow_down),
              //                   items: brawlerLevel.value.map((String items) {
              //                     return DropdownMenuItem(
              //                       value: items,
              //                       child: Text(items,style: GoogleFonts.acme(fontSize: 30,color: bordercolor),)
              //                     );
              //                   }).toList(),
              //                   onChanged: (String? newValue) {
              //                     dropdownValue.value = newValue!;
              //                   },
              //                 )
              //               ],
              //             ),
              //           ],),
              //         )),
              //       ),
              //       Container(
              //         width: MediaQuery.of(context).size.width,
              //         decoration: BoxDecoration(
              //         border: BorderDirectional(
              //           bottom: BorderSide(
              //             color: bordercolor,width: 5
              //           )
              //         )
              //       ),
              //         child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text("Health",style: GoogleFonts.acme(fontSize: 25,fontWeight: FontWeight.bold),),
              //               // Text(indexdata.health),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Container(
              //         decoration: BoxDecoration(
              //             border: BorderDirectional(
              //                 bottom: BorderSide(
              //                     color: bordercolor,width: 5
              //                 )
              //             )
              //         ),
              //         child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text("Movement Speed",style: GoogleFonts.acme(fontSize: 25,fontWeight: FontWeight.bold),),
              //               // Text(indexdata.health),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Container(
              //         height: 73,
              //         width: double.infinity,
              //         decoration: BoxDecoration(
              //             image: DecorationImage(
              //                 image: AssetImage("Asserts/images/borderbanner1.png")
              //             )
              //         ),
              //         child: Center(child: Padding(
              //           padding: const EdgeInsets.only(bottom: 12),
              //           child: Text("Attack",style: GoogleFonts.acme(color: bordercolor,fontWeight: FontWeight.bold, fontSize: 30),),
              //         )),
              //       ),
              //       Container(
              //         decoration: BoxDecoration(
              //             border: BorderDirectional(
              //                 bottom: BorderSide(
              //                     color: bordercolor,width: 5
              //                 )
              //             )
              //         ),
              //         child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text("Attack",style: GoogleFonts.acme(fontSize: 25,fontWeight: FontWeight.bold),),
              //               // Text(indexdata.health),
              //             ],
              //           ),
              //         ),
              //       ),
              //
              //       // Container(
              //       //   decoration: BoxDecoration(
              //       //       border: BorderDirectional(
              //       //           bottom: BorderSide(
              //       //               color: bordercolor,width: 5
              //       //           )
              //       //       )
              //       //   ),
              //       //   child: Padding(
              //       //     padding: const EdgeInsets.all(8.0),
              //       //     child: Row(
              //       //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       //       children: [
              //       //         Text("Attack",style: GoogleFonts.acme(fontSize: 25,fontWeight: FontWeight.bold),),
              //       //         // Text(indexdata.health),
              //       //       ],
              //       //     ),
              //       //   ),
              //       // ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}

