import 'package:json_annotation/json_annotation.dart';

part 'image_upload_response.g.dart';

@JsonSerializable()
class ImageUploadResponse {
  ImageUploadResponse(
      {this.name,
      this.bucket,
      this.generation,
      this.metageneration,
      this.contentType,
      this.timeCreated,
      this.updated,
      this.storageClass,
      this.size,
      this.md5Hash,
      this.contentEncoding,
      this.contentDisposition,
      this.crc32c,
      this.etag,
      this.downloadTokens});

  factory ImageUploadResponse.fromJson(Map<String, dynamic> json) {
    return _$ImageUploadResponseFromJson(json);
  }

  String? bucket;
  String? contentDisposition;
  String? contentEncoding;
  String? contentType;
  String? crc32c;
  String? downloadTokens;
  String? etag;
  String? generation;
  String? md5Hash;
  String? metageneration;
  String? name;
  String? size;
  String? storageClass;
  String? timeCreated;
  String? updated;

  Map<String, dynamic> toJson() {
    return _$ImageUploadResponseToJson(this);
  }
}