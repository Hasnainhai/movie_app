import 'package:bloc_movie_app/bloc/favouriteApp/favourite_app_bloc.dart';
import 'package:bloc_movie_app/bloc/favouriteApp/favourite_app_events.dart';
import 'package:bloc_movie_app/bloc/favouriteApp/favourite_app_state.dart';
import 'package:bloc_movie_app/models/favourite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  @override
  void initState() {
    context.read<FavouriteAppBloc>().add(FetchFavouriteEvents());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        actions: [
          BlocBuilder<FavouriteAppBloc, FavouriteAppState>(
            builder: (context, state) {
              return Visibility(
                visible: state.tempFavouriteItemList.isEmpty ? false : true,
                child: IconButton(
                    onPressed: () {
                      context.read<FavouriteAppBloc>().add(DeleteItems());
                    },
                    icon: const Icon(Icons.delete, color: Colors.white)),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<FavouriteAppBloc, FavouriteAppState>(
          builder: (context, state) {
        switch (state.listStatus) {
          case ListStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ListStatus.failure:
            return const Center(
              child: Text('error loading favourite List'),
            );
          case ListStatus.success:
            return ListView.builder(
                itemCount: state.favouriteItemList.length,
                itemBuilder: (context, index) {
                  final item = state.favouriteItemList[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        leading: Checkbox(
                            value: state.tempFavouriteItemList.contains(item)
                                ? true
                                : false,
                            onChanged: (value) {
                              if (value!) {
                                context
                                    .read<FavouriteAppBloc>()
                                    .add(SelectItem(favouriteItemModel: item));
                              } else {
                                context.read<FavouriteAppBloc>().add(
                                    UnSelectItem(favouriteItemModel: item));
                              }
                            }),
                        title: Text(item.value.toString()),
                        trailing: IconButton(
                            onPressed: () {
                              FavouriteItemModel itemModel = FavouriteItemModel(
                                  id: item.id,
                                  value: item.value,
                                  isFavourite: item.isFavourite ? false : true);
                              context.read<FavouriteAppBloc>().add(
                                  FavouriteItem(favouriteItemModel: itemModel));
                            },
                            icon: Icon(item.isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border)),
                      ),
                    ),
                  );
                });
        }
      }),
    );
  }
}
