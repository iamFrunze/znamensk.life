import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'vk_event.dart';
part 'vk_state.dart';

class VkBloc extends Bloc<VkEvent, VkState> {
  VkBloc() : super(VkInitial()) {
    on<VkEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
