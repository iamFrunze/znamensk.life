import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'movie_posters_event.dart';
part 'movie_posters_state.dart';

class MoviePostersBloc extends Bloc<MoviePostersEvent, MoviePostersState> {
  MoviePostersBloc() : super(MoviePostersInitial()) {
    on<MoviePostersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
