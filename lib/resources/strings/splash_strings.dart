class SplashStrings {
  static final shared = SplashStrings();

  String title(int code) => "Ошибка: код $code";
  final connectivityError = "Отсутствует соединение с интернетом";
  final parseError = "Ошибка обработки данных";
  final allow = "Продолжить";
}
