import 'package:bloc_movie_app/models/posts_model.dart';
import 'package:bloc_movie_app/utils/postStatus.dart';
import 'package:equatable/equatable.dart';

class PostState extends Equatable {
  final Poststatus poststatus;
  final List<PostsModel> postList;
  final List<PostsModel> tempPostList;
  final String message;

  const PostState(
      {this.poststatus = Poststatus.loading,
      this.postList = const <PostsModel>[],
      this.tempPostList = const <PostsModel>[],
      this.message = ''});

  PostState copyWith(
      {Poststatus? poststatus,
      List<PostsModel>? postList,
      String? message,
      List<PostsModel>? tempPostList}) {
    return PostState(
        poststatus: poststatus ?? this.poststatus,
        postList: postList ?? this.postList,
        tempPostList: tempPostList ?? this.tempPostList,
        message: message ?? this.message);
  }

  @override
  List<Object?> get props => [poststatus, postList, message, tempPostList];
}
