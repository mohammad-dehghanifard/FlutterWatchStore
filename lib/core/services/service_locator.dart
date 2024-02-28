 import 'package:flutter_watch_store/core/services/web_service.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

void injectDi() {
  di.registerSingleton<WebService>(WebService());
}