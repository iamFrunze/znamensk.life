import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'rss_event.dart';
part 'rss_state.dart';

class RssBloc extends Bloc<RssEvent, RssState> {
  RssBloc() : super(RssInitial()) {
    on<RssEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
