import 'package:equatable/equatable.dart';

abstract class FavouriteAppEvents extends Equatable {
  const FavouriteAppEvents();

  @override
  List<Object> get props => [];
}

class FetchFavouriteEvents extends FavouriteAppEvents {}
