import 'package:jsonplaceholder_bloc/post/model/post_model.dart';
import 'package:jsonplaceholder_bloc/post/resource/api_provider.dart';

class ApiRepo{
  final _provider = ApiProvider();

  Future<List<PostModel>> fetchApi() async{
    return _provider.fetchedData();
  }
}