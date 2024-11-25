import 'package:equatable/equatable.dart';

class FavouriteItemModel extends Equatable {
  const FavouriteItemModel(
      {required this.id,
      required this.value,
      this.isFavourite = false,
      this.isDelete = false});
  final String id;
  final String value;
  final bool isFavourite;
  final bool isDelete;
  FavouriteItemModel copyWith({
    String? id,
    String? value,
    bool? isFavourite,
    bool? isDelete,
  }) {
    return FavouriteItemModel(
        id: id ?? this.id,
        value: value ?? this.value,
        isFavourite: isFavourite ?? this.isFavourite,
        isDelete: isDelete ?? this.isDelete);
  }

  @override
  List<Object?> get props => [id, value, isFavourite, isDelete];
}
