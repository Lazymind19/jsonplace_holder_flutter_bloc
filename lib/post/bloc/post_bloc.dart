import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:jsonplaceholder_bloc/post/bloc/post_event.dart';
import 'package:jsonplaceholder_bloc/post/bloc/post_state.dart';
import 'package:jsonplaceholder_bloc/post/resource/api_repo.dart';
class PostBloc extends Bloc<PostEvent, PostState>{
  PostBloc() :super(PostInitial()){
    on<PostEvent>(_onEvent);
  }

  Future<void> _onEvent(PostEvent event, Emitter<PostState> emit) async{
    try{
      final repo = ApiRepo();
      emit(PostLoading());
      final _postList = await repo.fetchApi();
      emit(PostLoaded(postList: _postList));
      if(_postList[0].error != null){
        emit(PostError(error: _postList[0].error.toString()));
      }
    } catch(e){
      emit(PostError(error: e.toString()));
    }

  }
}