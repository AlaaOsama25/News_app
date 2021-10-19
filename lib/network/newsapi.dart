import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/news.dart';

Future<news> newsapi() async {
  final response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&category=health&apiKey=63337257821f4bb0b0c522714ae038a4'));

 if(response.statusCode==200){
   return news.fromJson(jsonDecode(response.body));
 }
 else
   throw Exception('failed to fetch news');
}
Future<news> sportnews() async {
  final response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=63337257821f4bb0b0c522714ae038a4'));

  if(response.statusCode==200){
    return news.fromJson(jsonDecode(response.body));
  }
  else
    throw Exception('failed to fetch news');
}
Future<news> technologynews() async {
  final response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&category=technology&apiKey=63337257821f4bb0b0c522714ae038a4'));

  if(response.statusCode==200){
    return news.fromJson(jsonDecode(response.body));
  }
  else
    throw Exception('failed to fetch news');
}