// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {

  PostModel({
    this.title,
    this.desc,
    this.postId,
    this.subcat,
  });

  String? title;
  String? desc;
  String? postId;
  String? subcat;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    title: json["title"],
    desc: json["desc"],
    postId: json["postId"],
    subcat: json["subcat"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "desc": desc,
    "postId": postId,
    "subcat": subcat,
  };
}
