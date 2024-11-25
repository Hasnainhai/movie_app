import 'package:bloc_movie_app/bloc/favouriteApp/favourite_app_events.dart';
import 'package:bloc_movie_app/bloc/favouriteApp/favourite_app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvents, FavouriteAppState> {
  FavouriteAppBloc() : super(const FavouriteAppState()) {}
}
