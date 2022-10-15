class PostModelService {
  int? postId;
  int? id;
  String? title;

  String? body;

  PostModelService({this.postId, this.id, this.title, this.body});

  PostModelService.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['postId'] = postId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
