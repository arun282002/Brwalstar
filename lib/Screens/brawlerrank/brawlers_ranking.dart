import 'package:brawlstar/Constants/colors.dart';
import 'package:brawlstar/Models/Brawlers/brawler.dart';
import 'package:brawlstar/Services/RankingBrawler.dart';
import 'package:brawlstar/Services/brawlstars_api.dart';
import 'package:brawlstar/Services/iconapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hash_cached_image/hash_cached_image.dart';

class BrawlersRanking extends HookWidget {
  const BrawlersRanking({super.key});

  @override
  Widget build(BuildContext context) {
    final iconsdata = useMemoized(() => iconAPI1.fetchicon());
    final icons = useFuture(iconsdata);

    var brawlerIndex = useState(0);
    var Brawlers = useState<List<Brawler>>([]);


    Future<void> fethBrawler() async {
      List<Brawler> response = await BrawlstarsApi.fethBrawler();
      Brawlers.value = response;
      // print("final data");
      // print(Brawlers);
    }

    useEffect(
      () {
        fethBrawler();
        return null;
      },[]
    );

    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme:IconThemeData(color: bordercolor),
        title: Text(
          "Brawlers Rank",
          style: GoogleFonts.acme(color: bordercolor,fontSize: 25),
        ),
      ),
      body: Brawlers.value.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: Brawlers.value.length,
              itemBuilder: (context, index) {
                brawlerIndex.value = index;
                // RankingBrawlerApi()
                //     .getrankingbrawlerapi(Brawlers.value[index].id);
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: cntcolor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: bordercolor, width: 3)),
                    child: ExpansionTile(
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            child: Text(
                              "${index + 1}",
                              style: GoogleFonts.acme(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 70,
                              width: 70,
                              child:
                                  Image.network(Brawlers.value[index].imageUrl),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              Brawlers.value[index].name,overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.acme(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      children: [
                        FutureBuilder(
                          future: RankingBrawlerApi().getrankingbrawlerapi(
                              Brawlers.value[brawlerIndex.value].id),
                          builder: (context, snapshot) {
                            // print("details data");
                            // print(Brawlers.value[brawlerIndex.value].id);
                            if (snapshot.hasData) {
                              var rankingList = snapshot.data as List;
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: rankingList.length,
                                itemBuilder: (context, index) {
                                  print(rankingList);
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: cntcolor,
                                      border: Border.all(
                                          color: bordercolor, width: 2),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10,),
                                        Container(
                                          width: 50,
                                          child: Center(
                                            child: Text(
                                                "${rankingList[index]['rank']}",style: GoogleFonts.acme(fontSize: 25,fontWeight: FontWeight.bold),),
                                          ),
                                        ),
                                        SizedBox(width: 20,),
                                        Container(
                                          height: 60,
                                          width: 60,
                                          child:
                                          icons.data!['player']['${RankingBrawlerApi.list[index]['icon']['id']}'] != null
                                              ? Center(
                                            child: HashCachedImage(
                                                imageUrl: icons.data!['player']['${RankingBrawlerApi.list[index]['icon']['id']}']
                                                ['imageUrl']),
                                          )
                                              : const SizedBox.shrink(),

                                        ),
                                        SizedBox(width: 10,),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("${rankingList[index]['name']}",overflow: TextOverflow.ellipsis,style: GoogleFonts.acme(fontSize: 25,fontWeight: FontWeight.bold,
                                                  color: Color(int.parse(
                                                      "${RankingBrawlerApi.list[index]['nameColor']}")
                                                  ),
                                                ),),
                                                Text("${RankingBrawlerApi.list[index]['club']==null?"":RankingBrawlerApi.list[index]['club']['name']}",overflow: TextOverflow.ellipsis,style: GoogleFonts.acme(fontSize: 20,),),
                                                Row(
                                                  children: [
                                                    Container(height: 25,width: 30,child: Image.asset("Asserts/images/rank.png"),),
                                                    Text("${RankingBrawlerApi.list[index]['trophies']}",overflow: TextOverflow.ellipsis,style: GoogleFonts.acme(fontSize: 20),),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            } else if (snapshot.hasError) {
                              return Center(child: Text("${snapshot.error}"));
                            } else if(snapshot.connectionState == ConnectionState.waiting){
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return Center(child: Text("No data available"));
                            }
                          },
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
