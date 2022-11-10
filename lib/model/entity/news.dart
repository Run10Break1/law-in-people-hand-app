import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:html/parser.dart' show parse;

part 'news.g.dart';

@JsonSerializable()
class NaverNews {
  final String title;
  @JsonKey(name: "originallink")
  final String originalLink;
  final String link;
  final String description;
  final DateTime pubDate;

  const NaverNews(
      this.title,
      this.originalLink,
      this.link,
      this.description,
      this.pubDate,
      );

  factory NaverNews.fromJson(dynamic json) => _$NaverNewsFromJson(json);
}

Future<String?> getImage(String url) async {
  final dio = Dio();
  dio.options.responseType = ResponseType.plain;

  String html = (await dio.get(url)).data;
  final document = parse(html);
  final head = document.head;
  if(head == null) {
    return null;
  }

  final imageTag = head.querySelector('meta[property="og:image"]');
  if(imageTag == null) {
    return null;
  }

  return imageTag.attributes["content"];
}

// void main() async {
//   print("image url : ${await getImage("http://www.nspna.com/news/?mode=view&newsid=602563")}");
// }