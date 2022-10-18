class User {
  String? name;
  String? description;
  String? url;

  User(this.name, this.description, this.url);

  User.fromJson(Map<String, dynamic> json) {//Map listesinden okumayı entegre ettim
    name = json['name'];
    description = json['description'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {//Bir json oluşturma
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['url'] = url;
    return data;
  }
}