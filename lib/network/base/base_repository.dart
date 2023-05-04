import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:payaki/network/client/http_service.dart';

abstract class BaseRepository {
  final HttpService httpService;
  final apiQueue = Queue<CancelToken>();
  BaseRepository(this.httpService);
}
