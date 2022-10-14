class PostModelService {
  String? title;
  String? body;
  int? userId;

  PostModelService({this.title, this.body, this.userId});

  PostModelService.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    data['userId'] = userId;
    return data;
  }
}
