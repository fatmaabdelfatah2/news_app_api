import 'dart:convert';

class ArticleModel {

String ?author;
String ?image;
String ?date;
String ?title;
String ?description;

ArticleModel({
this.author,
this.image,
this.date,
this.title,
this.description,
});

ArticleModel.fromJson(Map <String,dynamic> json){
  author=json['author'];
  image=json['urlToImage'];
  title=json['title'];
  date=json['publishedAt'];
  description=json['description'];
}

}