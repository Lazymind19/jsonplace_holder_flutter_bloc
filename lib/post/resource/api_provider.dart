import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:jsonplaceholder_bloc/post/const/const.dart';
import 'package:jsonplaceholder_bloc/post/model/post_model.dart';
class ApiProvider{
  final _dio = Dio();

  Future<List<PostModel>> fetchedData() async {
     List<PostModel> postList= [];
    try {
      Response response = await _dio.get(URL);
      log("${response.data}");
      if(response.statusCode == 200) {
        log("response ${response.data}");
        var responseList = response.data as List;
      postList = responseList.map((e) => PostModel.fromJson(e)).toList();
        log("parsed $postList");
      return postList;
      }
      else {
        return postList;
      }

    } catch(error, trace){
      log("Error is $error and tracec is $trace");
      postList.add(PostModel.withError(error: error.toString()));
      return postList;

    }
  }

}