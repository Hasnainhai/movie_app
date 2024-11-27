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

  // final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Posts'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextFormField(
            // controller: searchController,
            decoration: const InputDecoration(
              hintText: 'Search by name...',
              border: OutlineInputBorder(),
            ),
            onChanged: (filterKey) {
              context.read<PostsBloc>().add(SearchPosts(filterKey));
            },
          ),
          Expanded(
            child: BlocBuilder<PostsBloc, PostState>(builder: (context, state) {
              // switch (state.poststatus) {
              //   case Poststatus.loading:
              //     return const Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   case Poststatus.failure:
              //     return const Center(
              //       child: Text('Post status failed'),
              //     );
              //   case Poststatus.success:
              return ListView.builder(
                itemCount: state.tempPostList.isEmpty
                    ? state.postList.length
                    : state.tempPostList.length,
                itemBuilder: (context, index) {
                  if (state.tempPostList.isNotEmpty) {
                    final post = state.tempPostList[index];
                    return Card(
                      child: ListTile(
                        title: Text(
                          post.title.toString(),
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(post.body.toString()),
                      ),
                    );
                  } else {
                    final post = state.postList[index];
                    return Card(
                      child: ListTile(
                        title: Text(
                          post.title.toString(),
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(post.body.toString()),
                      ),
                    );
                  }
                },
              );
              // }
            }),
          ),
        ],
      ),
    );
  }
}
