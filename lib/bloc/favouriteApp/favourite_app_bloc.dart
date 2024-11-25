import 'package:bloc_movie_app/bloc/favouriteApp/favourite_app_events.dart';
import 'package:bloc_movie_app/bloc/favouriteApp/favourite_app_state.dart';
import 'package:bloc_movie_app/models/favourite_item_model.dart';
import 'package:bloc_movie_app/repositories/favourite_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvents, FavouriteAppState> {
  FavouriteRepository favouriteRepository;
  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> tempFavouriteList = [];
  FavouriteAppBloc(this.favouriteRepository)
      : super(const FavouriteAppState()) {
    on<FetchFavouriteEvents>(fetchList);
    on<FavouriteItem>(fetchItem);
    on<SelectItem>(selectItem);
    on<UnSelectItem>(unSelectItem);
    on<DeleteItems>(deleteItems);
  }
// fetch List fun
  void fetchList(
      FetchFavouriteEvents events, Emitter<FavouriteAppState> emit) async {
    favouriteList = await favouriteRepository.getItems();
    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        listStatus: ListStatus.success));
  }

// fetch Item fun
  void fetchItem(FavouriteItem events, Emitter<FavouriteAppState> emit) {
    final index = favouriteList
        .indexWhere((element) => element.id == events.favouriteItemModel.id);
    if (events.favouriteItemModel.isFavourite) {
      if (tempFavouriteList.contains(favouriteList[index])) {
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(events.favouriteItemModel);
      }
    } else {
      if (tempFavouriteList.contains(favouriteList[index])) {
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(events.favouriteItemModel);
      }
    }

    favouriteList[index] = events.favouriteItemModel;
    emit(state.copyWith(
      favouriteItemList: List.from(favouriteList),
      tempFavouriteItemList: List.from(tempFavouriteList),
    ));
  }

// select Item fun
  void selectItem(SelectItem events, Emitter<FavouriteAppState> emit) {
    tempFavouriteList.add(events.favouriteItemModel);
    emit(state.copyWith(
        tempFavouriteItemList: List.from(tempFavouriteList),
        listStatus: ListStatus.success));
  }

// unSelect Item fun
  void unSelectItem(UnSelectItem events, Emitter<FavouriteAppState> emit) {
    tempFavouriteList.remove(events.favouriteItemModel);
    emit(state.copyWith(
        favouriteItemList: List.from(tempFavouriteList),
        listStatus: ListStatus.success));
  }

  // Deleted Selected Items fun
  void deleteItems(DeleteItems events, Emitter<FavouriteAppState> emit) {
    for (int i = 0; i < tempFavouriteList.length; i++) {
      favouriteList.remove(tempFavouriteList[i]);
    }
    tempFavouriteList.clear;
    emit(state.copyWith(
      favouriteItemList: List.from(favouriteList),
      tempFavouriteItemList: List.from(tempFavouriteList),
      listStatus: ListStatus.success,
    ));
  }
}
