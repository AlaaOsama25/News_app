import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/network/newsapi.dart';
import 'package:url_launcher/url_launcher.dart';

class HealthDetailedScreen extends StatefulWidget {
  const HealthDetailedScreen({Key? key, required this.index, required this.title}) : super(key: key);

  final index;
  final title;


  @override
  _DetailedScreenState createState() =>
      _DetailedScreenState(index: index, title: title);
}

class _DetailedScreenState extends State<HealthDetailedScreen> {
  _DetailedScreenState({this.index, required this.title});

  final index;
  final String title;


  late Future<news> health_articles;

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
    health_articles = newsapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(title),
      ),
      body: FutureBuilder<news>(
        future: health_articles,
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

// Future<void> _launchInBrowser(String url) async {
//   if (await canLaunch(url)) {
//     await launch(
//       url,
//       forceSafariVC: false,
//       forceWebView: false,
//       headers: <String, String>{'my_header_key': 'my_header_value'},
//     );
//   } else {
//     throw 'Could not launch $url';
//   }
// }

}
