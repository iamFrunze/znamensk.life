import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import 'package:znamensk/data/models/rss_feed_model.dart';
import 'package:znamensk/resources/strings/application_strings.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<SplashLoadDataEvent>(_loadData);
  }

  Future<void> _loadData(
    SplashLoadDataEvent event,
    Emitter<SplashState> emiter,
  ) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final client = http.Client();

    if (connectivityResult == ConnectivityResult.none) {
      print("Connectivity error");
      // TODO add string resource for none network
      emit(SplashLoadErrorState("Connectivity error"));
    }

    try {
      final response =
          await client.get(Uri.parse(ApplicationStrings.shared.RSSFeed));
      final feed = RssFeed.parse(response.body).items;
      final listOfItems = List<RssFeedModel>.empty();
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
      emit(SplashLoadSuccessState(listOfItems));
    } catch (e) {
      print("Parse error::: $e");
      // TODO add string resource for none network
      emit(SplashLoadErrorState("Parse error"));
    }
  }
}
