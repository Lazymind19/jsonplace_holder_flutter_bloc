import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  int? userId;
  int? id;
  String? title;
  String? body;
  String? error;

  PostModel({this.userId, this.id, this.title, this.body});

  PostModel.withError({String? error}){
    error = error;
  }

  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
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
  List<Object?> get props => [userId,id,title,body,error];
}
