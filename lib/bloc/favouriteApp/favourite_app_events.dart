import 'package:bloc_movie_app/models/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteAppEvents extends Equatable {
  const FavouriteAppEvents();

  @override
  List<Object> get props => [];
}

class FetchFavouriteEvents extends FavouriteAppEvents {}

class FavouriteItem extends FavouriteAppEvents {
  const FavouriteItem({required this.favouriteItemModel});
  final FavouriteItemModel favouriteItemModel;
}

class SelectItem extends FavouriteAppEvents {
  const SelectItem({required this.favouriteItemModel});
  final FavouriteItemModel favouriteItemModel;
}

class UnSelectItem extends FavouriteAppEvents {
  const UnSelectItem({required this.favouriteItemModel});
  final FavouriteItemModel favouriteItemModel;
}

class DeleteItems extends FavouriteAppEvents {}
