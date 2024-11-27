import 'package:bloc_movie_app/bloc/postsBloc/post_event.dart';
import 'package:bloc_movie_app/bloc/postsBloc/post_state.dart';
import 'package:bloc_movie_app/models/posts_model.dart';
import 'package:bloc_movie_app/repositories/posts_repository.dart';
import 'package:bloc_movie_app/utils/postStatus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsBloc extends Bloc<PostEvent, PostState> {
  List<PostsModel> tempPostList = [];
  PostRepository postsRepository = PostRepository();
  PostsBloc() : super(const PostState()) {
    on<FetchPosts>(_fetchPosts);
    on<SearchPosts>(_filterPosts);
  }
// fetch posts
  void _fetchPosts(FetchPosts events, Emitter<PostState> emit) async {
    await postsRepository.fetchPost().then((value) {
      emit(state.copyWith(
          poststatus: Poststatus.success, postList: value, message: 'success'));
    }).onError((error, stackTrace) {
      print(error.toString());
      print('stackstacrece : $stackTrace');
      emit(state.copyWith(
        poststatus: Poststatus.failure,
        message: 'error msg: $error',
      ));
    });
  }

// search posts
  void _filterPosts(SearchPosts events, Emitter<PostState> emit) async {
    tempPostList = state.postList
        .where((element) => element.id.toString() == events.search.toString())
        .toList();
    emit(state.copyWith(tempPostList: tempPostList));
  }
}
