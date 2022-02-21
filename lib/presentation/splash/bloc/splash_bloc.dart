import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import 'package:znamensk/data/models/rss_feed_model.dart';
import 'package:znamensk/resources/strings/application_strings.dart';
import 'package:znamensk/resources/strings/splash_strings.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<SplashLoadDataEvent>(_loadData);
  }

  Future<void> _loadData(
    SplashLoadDataEvent event,
    Emitter<SplashState> emit,
  ) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final client = http.Client();

    if (connectivityResult == ConnectivityResult.none) {
      print("Connectivity error");
      emit(SplashLoadErrorState(1, SplashStrings.shared.connectivityError));
    }

    try {
      final response =
          await client.get(Uri.parse(ApplicationStrings.shared.RSSFeed));
      final feed = RssFeed.parse(response.body).items;
      final listOfItems = <RssFeedModel>[];
      feed?.forEach((element) {
        final model = RssFeedModel(
          title: element.title,
          link: element.link,
          category: element.categories?[0].value,
          enclosure: element.enclosure,
          pubDate: element.pubDate,
        );
        listOfItems.add(model);
      });
      emit(SplashLoadSuccessState());
    } catch (e) {
      print("Parse error::: $e");
      emit(SplashLoadErrorState(2, SplashStrings.shared.parseError));
    }
  }
}
