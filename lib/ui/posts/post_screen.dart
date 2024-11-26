import 'package:bloc_movie_app/bloc/postsBloc/post_event.dart';
import 'package:bloc_movie_app/bloc/postsBloc/post_state.dart';
import 'package:bloc_movie_app/bloc/postsBloc/posts_bloc.dart';
import 'package:bloc_movie_app/utils/postStatus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    context.read<PostsBloc>().add(FetchPosts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Posts'),
        centerTitle: true,
      ),
      body: BlocBuilder<PostsBloc, PostState>(builder: (context, state) {
        switch (state.poststatus) {
          case Poststatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case Poststatus.failure:
            return const Center(
              child: Text('Post status failed'),
            );
          case Poststatus.success:
            return ListView.builder(
                itemCount: state.postList.length,
                itemBuilder: (context, index) {
                  final post = state.postList[index];
                  return ListTile(
                    title: Text(post.title.toString()),
                    subtitle: Text(post.body.toString()),
                  );
                });
        }
      }),
    );
  }
}
