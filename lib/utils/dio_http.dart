import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:haoke/config.dart';

class DioHttp {

  //写一个单例
  //在 Dart 里，带下划线开头的变量是私有变量
  Dio _client;
  BuildContext context;

  static DioHttp of(context) {
    return DioHttp._internal(context);
  }

  DioHttp._internal(BuildContext context) {
    if (_client == null || context != this.context) {
      this.context = context;
      var options = BaseOptions(
          baseUrl: Config.BaseUrl,
          receiveTimeout: 1000 * 3,
          connectTimeout: 1000 * 10,
          extra: {'context': context});

      var client = Dio(options);
      this._client = client;
    }
  }

  Future<Response<Map<String, dynamic>>> get(String path,
      [Map<String, dynamic> params, String token]) async {
    var options = Options(headers: {'Authorization': token});
    return await _client.get(path, queryParameters: params, options: options);
  }

  Future<Response<Map<String, dynamic>>> post(String path,
      [Map<String, dynamic> params, String token]) async {
    var options = Options(headers: {'Authorization': token});
    return await _client.post(path, data: params, options: options);
  }

  Future<Response<Map<String, dynamic>>> postFormData(String path,
      [Map<String, dynamic> params, String token]) async {
    var options = Options(
        // contentType: ContentType.parse('multipart/form-data'),
        headers: {'Authorization': token});
    return await _client.post(path, data: params, options: options);
  }
}
