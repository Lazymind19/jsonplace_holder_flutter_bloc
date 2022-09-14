import 'package:equatable/equatable.dart';
import 'package:jsonplaceholder_bloc/post/model/post_model.dart';
part of "post_bloc.dart";

abstract class PostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<PostModel> postList;

  PostLoaded({required this.postList});
}

class PostError extends PostState {
  final String error;

  PostError({required this.error});
}
