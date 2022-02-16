import 'package:webfeed/domain/rss_enclosure.dart';
import 'package:webfeed/webfeed.dart';

class RssFeedModel {
  final String? title;
  final String? link;
  final String? category;
  final RssEnclosure? enclosure;
  final DateTime? pubDate;

  RssFeedModel({
    this.title,
    this.link,
    this.category,
    this.enclosure,
    this.pubDate,
  });

  @override
  String toString() {
    return """
    title - $title \n
    link - $link \n
    category  - $category \n
    enclosure - ${enclosure?.url} \n
    pubDate - $pubDate
    """;
  }
}
