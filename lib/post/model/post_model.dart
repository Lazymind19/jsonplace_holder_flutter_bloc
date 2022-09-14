import 'dart:convert';

import 'package:equatable/equatable.dart';

List<PostModel> postModelFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(List<PostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModel extends Equatable {
  int? userId;
  int? id;
  String? title;
  String? body;
  String? error;

  PostModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  PostModel.withError({String? error}) {
    error = error;
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }

  @override
  List<Object?> get props => [userId, id, title, body, error];
}
