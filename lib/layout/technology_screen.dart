import 'package:flutter/material.dart';
import 'package:news_app/layout/technology_detailedscreen.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/network/newsapi.dart';
class TechnologyScreen extends StatefulWidget {
  const TechnologyScreen({Key? key}) : super(key: key);

  @override
  _TechnologyScreenState createState() => _TechnologyScreenState();
}

class _TechnologyScreenState extends State<TechnologyScreen> {

  late Future<news> technology_articles;

  Future<void> _getData() async {
    setState(() {
      newsapi();
    });
  }

  @override
  void initState() {
    super.initState();
    technology_articles = technologynews();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<news>(
      future: technology_articles,
      builder: (context, snapshot){
        if(snapshot.hasData){
          List<newsArticles?>? info =snapshot.data!.articles;
          return
            Center(child:
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RefreshIndicator(
                color: Colors.purple,
                onRefresh: _getData,
                child: ListView.separated(
                    itemCount: info!.length,
                    separatorBuilder: (context,index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey,
                        ),
                      );
                    },
                    itemBuilder: (BuildContext context, int index){
                      return Column(
                        //mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>
                                  TechnologyDetailedScreen(index :index,title:info[index]!.source!.name.toString())),
                                );
                              });
                            },
                            child: Container(
                              height: 300,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    //SizedBox(height: 20.0,),
                                    Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0),

                                      ),
                                      height: 200,
                                      //width: double.infinity,
                                      child: (info[index]!.urlToImage==null)?
                                      Center(child: Text('لا يوجد صوره متوفرة ')) :
                                      Image.network(info[index]!.urlToImage.toString()

                                        ,width: double.infinity,height: 200,fit: BoxFit.cover,),
                                    ),
                                    SizedBox(height: 10,),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Text(info[index]!.title.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.end,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(height: 10.0,),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ],
                      );
                    }


                ),
              ),
            ),
            );
        }
        else if(snapshot.hasError){
          return Text('${snapshot.error}');
        }
        else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: Colors.purple,),
                Text('LOADING'),
              ],
            ),
          );
        }
      },
    );
  }
}
