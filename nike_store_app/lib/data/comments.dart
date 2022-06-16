class CommentEntity {
  final int id;
  final String title;
  final String content;
  final String date;
  final String author;

  CommentEntity.formJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        content = json['content'],
        date = json['date'],
        author = json['author']['email'];
}
