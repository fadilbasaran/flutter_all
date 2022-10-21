import 'package:json_annotation/json_annotation.dart';

part 'resource_model.g.dart';

@JsonSerializable()
class ResourceModel {
  List<Data>? data;

  ResourceModel({this.data});

  factory ResourceModel.fromJson(Map<String, dynamic> json) {
    return _$ResourceModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResourceModelToJson(this);
  }
}

@JsonSerializable(
    //createToJson: false

    )
class Data {
  final int? id;
  final String? name;
  final int? year;
  final String? color;
  final String? pantoneValue;
  final String? price;
  final StatusCode status;

  Data(this.status,
      {this.id,
      this.name,
      this.year,
      this.color,
      this.pantoneValue,
      this.price});

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}

enum StatusCode {
  @JsonValue(200)
  success,
  @JsonValue(500)
  weired
}
