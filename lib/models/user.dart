class Post {
  String userId;
  String title;
  String content;
  Post(
    this.content,
    this.title,
    this.userId,
  );
  Post.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        title = json['title'],
        content = json['content'];
  Map<String, dynamic> toJson() => {
        'userId': userId,
        'title': title,
        'content': content,
      };
}