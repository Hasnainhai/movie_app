import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class FetchPosts extends PostEvent {}

class SearchPosts extends PostEvent {
  SearchPosts(this.search);
  String search;
}
