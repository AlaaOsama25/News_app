import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/network/newsapi.dart';
import 'package:url_launcher/url_launcher.dart';
class TechnologyDetailedScreen extends StatefulWidget {
  const TechnologyDetailedScreen({Key? key,required this.index, required this.title}) : super(key: key);

  final index;
  final title;

  @override
  _TechnologyDetailedScreenState createState() =>
      _TechnologyDetailedScreenState(index: index, title: title);
}

class _TechnologyDetailedScreenState extends State<TechnologyDetailedScreen> {
  _TechnologyDetailedScreenState({this.index, required this.title});

  final index;
  final String title;

  late Future<news> technology_articles;

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    technology_articles = technologynews();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(title),
      ),
      body: FutureBuilder<news>(
        future: technology_articles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<newsArticles?>? info = snapshot.data!.articles;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      height: 200,
                      //width: double.infinity,
                      child: (info![index]!.urlToImage==null)?
                      Center(child: Text('لا يوجد صوره متوفرة ')) :
                      Image.network(info[index]!.urlToImage.toString(),
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        info[index]!.source!.name.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            info[index]!.title.toString(),
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.end,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            info[index]!.description.toString(),
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      ': لمزيد من المعلومات اضغط هنا',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade700),
                      textAlign: TextAlign.end,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _launchURL('${info[index]!.url.toString()}');
                        });
                      },
                      child: Text(
                        info[index]!.url.toString(),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    (info[index]!.author==null)? Text('ليس متوفر') :
                    Text(
                      '${info[index]!.author.toString()} : نشر بواسطة',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade700),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Colors.purple,
                  ),
                  Text('LOADING'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
