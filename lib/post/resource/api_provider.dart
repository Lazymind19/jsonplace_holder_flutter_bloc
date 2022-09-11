
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:jsonplaceholder_bloc/post/const/const.dart';
import 'package:jsonplaceholder_bloc/post/model/post_model.dart';
import '';
class ApiProvider{
  final _dio = Dio();

  Future<List<PostModel>> fetchedData() async {
    List<PostModel> postList= [];
    try {
      Response response = await _dio.get("$URL+$POSTS");
      List parsed = json.decode(response.data);
       postList = parsed.map((e) => PostModel.fromJson(e))
          .toList();

      return postList;
    } catch(e){
      postList.add(PostModel.withError(error: e.toString()));
      return postList;



    }
  }

}