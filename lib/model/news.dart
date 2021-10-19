class newsArticlesSource {
/*
{
  "id": null,
  "name": "Bitcoin.com"
}
*/

  String? id;
  String? name;

  newsArticlesSource({
    this.id,
    this.name,
  });
  newsArticlesSource.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toString();
    name = json["name"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["name"] = name;
    return data;
  }
}

class newsArticles {
/*
{
  "source": {
    "id": null,
    "name": "Bitcoin.com"
  },
  "author": null,
  "title": "El Salvador Starts Mass Buying Bitcoin Ahead of BTC Becoming Legal Tender Tomorrow – News Bitcoin News - Bitcoin News",
  "description": "Bitcoin will become legal tender in El Salvador Tuesday, Sept. 7. The Salvadoran government has started buying bitcoin ahead of the law taking effect. The first 200 coins have been purchased and \"a lot more\" are coming, said President Nayib Bukele.",
  "url": "https://news.bitcoin.com/el-salvador-mass-buying-bitcoin-ahead-of-btc-becoming-legal-tender/",
  "urlToImage": "https://static.news.bitcoin.com/wp-content/uploads/2021/09/el-salvador-200coins.jpg",
  "publishedAt": "2021-09-06T21:41:58Z",
  "content": "Bitcoin will become legal tender in El Salvador on Tuesday, Sept. 7. The Salvadoran government has started buying bitcoin ahead of the law taking effect. The first 200 coins have been purchased and “… [+2639 chars]"
}
*/

  newsArticlesSource? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  newsArticles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });
  newsArticles.fromJson(Map<String, dynamic> json) {
    source = (json["source"] != null) ? newsArticlesSource.fromJson(json["source"]) : null;
    author = json["author"]?.toString();
    title = json["title"]?.toString();
    description = json["description"]?.toString();
    url = json["url"]?.toString();
    urlToImage = json["urlToImage"]?.toString();
    publishedAt = json["publishedAt"]?.toString();
    content = json["content"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (source != null) {
      data["source"] = source!.toJson();
    }
    data["author"] = author;
    data["title"] = title;
    data["description"] = description;
    data["url"] = url;
    data["urlToImage"] = urlToImage;
    data["publishedAt"] = publishedAt;
    data["content"] = content;
    return data;
  }
}

class news {
/*
{
  "status": "ok",
  "totalResults": 70,
  "articles": [
    {
      "source": {
        "id": null,
        "name": "Bitcoin.com"
      },
      "author": null,
      "title": "El Salvador Starts Mass Buying Bitcoin Ahead of BTC Becoming Legal Tender Tomorrow – News Bitcoin News - Bitcoin News",
      "description": "Bitcoin will become legal tender in El Salvador Tuesday, Sept. 7. The Salvadoran government has started buying bitcoin ahead of the law taking effect. The first 200 coins have been purchased and \"a lot more\" are coming, said President Nayib Bukele.",
      "url": "https://news.bitcoin.com/el-salvador-mass-buying-bitcoin-ahead-of-btc-becoming-legal-tender/",
      "urlToImage": "https://static.news.bitcoin.com/wp-content/uploads/2021/09/el-salvador-200coins.jpg",
      "publishedAt": "2021-09-06T21:41:58Z",
      "content": "Bitcoin will become legal tender in El Salvador on Tuesday, Sept. 7. The Salvadoran government has started buying bitcoin ahead of the law taking effect. The first 200 coins have been purchased and “… [+2639 chars]"
    }
  ]
}
*/

  String? status;
  int? totalResults;
  List<newsArticles?>? articles;

  news({
    this.status,
    this.totalResults,
    this.articles,
  });
  news.fromJson(Map<String, dynamic> json) {
    status = json["status"]?.toString();
    totalResults = json["totalResults"]?.toInt();
    if (json["articles"] != null) {
      final v = json["articles"];
      final arr0 = <newsArticles>[];
      v.forEach((v) {
        arr0.add(newsArticles.fromJson(v));
      });
      articles = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["status"] = status;
    data["totalResults"] = totalResults;
    if (articles != null) {
      final v = articles;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["articles"] = arr0;
    }
    return data;
  }
}
