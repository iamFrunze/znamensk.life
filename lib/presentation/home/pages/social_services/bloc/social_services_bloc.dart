import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'social_services_event.dart';
part 'social_services_state.dart';

class SocialServicesBloc extends Bloc<SocialServicesEvent, SocialServicesState> {
  SocialServicesBloc() : super(SocialServicesInitial()) {
    on<SocialServicesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
