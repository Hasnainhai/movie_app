import 'package:bloc_movie_app/models/favourite_item_model.dart';

class FavouriteRepository {
  Future<List<FavouriteItemModel>> getItems() async {
    await Future.delayed(const Duration(seconds: 5));

    return List.of(genetareList(10));
  }

  List<FavouriteItemModel> genetareList(int length) {
    return List.generate(
        length,
        (index) =>
            FavouriteItemModel(id: index.toString(), value: 'items $index'));
  }
}
