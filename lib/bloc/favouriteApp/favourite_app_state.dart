import 'package:bloc_movie_app/models/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { loading, success, failure }

class FavouriteAppState extends Equatable {
  final List<FavouriteItemModel> favouriteItemList;
  final List<FavouriteItemModel> tempFavouriteItemList;
  final ListStatus listStatus;
  const FavouriteAppState(
      {this.favouriteItemList = const [],
      this.tempFavouriteItemList = const [],
      this.listStatus = ListStatus.loading});

  FavouriteAppState copyWith(
      {List<FavouriteItemModel>? favouriteItemList,
      ListStatus? listStatus,
      List<FavouriteItemModel>? tempFavouriteItemList}) {
    return FavouriteAppState(
        favouriteItemList: favouriteItemList ?? this.favouriteItemList,
        listStatus: listStatus ?? this.listStatus,
        tempFavouriteItemList:
            tempFavouriteItemList ?? this.tempFavouriteItemList);
  }

  @override
  List<Object?> get props =>
      [favouriteItemList, listStatus, tempFavouriteItemList];
}
