import 'dart:async';

import 'package:mymovies/presentation/utils/api_response.dart';

abstract class BaseBloc {
  void launchDataLoad<T>(StreamController stream, Function function) async {
    stream.add(ApiResponse<T>.loading());
    try {
      stream.add(ApiResponse<T>.completed(await function()));
    } catch (e) {
      stream.add(ApiResponse<T>.error(e.toString()));
    }
  }

  void dispose();
}
