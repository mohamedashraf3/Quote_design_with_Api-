class QuoteModel {
  String? qotd_date;
  Quote? quote;

  QuoteModel({this.qotd_date, this.quote});

  QuoteModel.fromJson(Map<String, dynamic> json) {
    qotd_date = json['qotd_date'];
    quote = Quote.fromJson(json['quote']);
  }
}

class Quote {
  int? id;
  bool? dialogue;
  bool? private;
  List<String>? tags;
  String? url;
  int? favoritesCount;
  int? upVotesCount;
  int? downVotesCount;
  String? author;
  String? authorPermalink;
  String? body;

  Quote(
      {this.id,
      this.dialogue,
      this.private,
      this.tags,
      this.url,
      this.favoritesCount,
      this.upVotesCount,
      this.downVotesCount,
      this.author,
      this.authorPermalink,
      this.body});

  Quote.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dialogue = json['dialogue'];
    private = json['private'];
    tags = json['tags'].cast<String>();
    url = json['url'];
    favoritesCount = json['favorites_count'];
    upVotesCount = json['upvotes_count'];
    downVotesCount = json['downvotes_count'];
    author = json['author'];
    authorPermalink = json['author_permalink'];
    body = json['body'];
  }
}
