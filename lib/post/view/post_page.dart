import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder_bloc/post/bloc/post_bloc.dart';
import 'package:jsonplaceholder_bloc/post/bloc/post_event.dart';
import 'package:jsonplaceholder_bloc/post/bloc/post_state.dart';

import '../model/post_model.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _postBloc = PostBloc();

  @override
  void initState() {
    _postBloc.add(GetListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetched Posts"),
      ),
      body: _postBody(),
    );
  }

  Widget _postBody() {
    return Container(
      margin: EdgeInsets.all(10),
      child: BlocProvider(
        create: (_) => _postBloc,
        child: BlocListener<PostBloc, PostState>(
          listener: (context, state) {
            if (state is PostError) {
              _showErrorWidget(state.error);
            }
          },
          child: BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              if (state is PostInitial) {
                return _loadingWidget();
              } else if (state is PostLoading) {
                return _loadingWidget();
              } else if (state is PostLoaded) {
                return _loadedWidget(context, state.postList);
              } else if (state is PostError) {
                return _showErrorWidget(state.error);
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  //For showing error if occurs
  Widget _showErrorWidget(String error) {
    return Center(
      child: Text(
        error,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }

  //Loading indicator for loading and initial state
  Widget _loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  //Widget for loaded state
  Widget _loadedWidget(BuildContext context, List<PostModel> postList) {
    return ListView.builder(
        itemCount: postList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black, width: 2.0))),
            child: Column(
              children: [
                Text("${postList[index].userId}"),
                Text("${postList[index].title}"),
                Text("${postList[index].body}"),
              ],
            ),
          );
        });
  }
}
