import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_demo_1/api/apis.dart';
import 'package:flutter_demo_1/entity_factory.dart';

/// 网络请求
///
/// 注意事项，一定要写 T 的类型
/// T 的具体Bean类型一定要先写
///
/* example:
HttpUtil.getInstance().get<UserEntity>(
  Api.user1Url,
  (UserEntity result) {
    result.persons.forEach((person){
      print(person.name);
    });
  },
  errorCallBack: (errorMsg) {
    print(errorMsg);
  },
);
*/

class HttpUtil {
  HttpUtil._();

  static HttpUtil _instance;

  static HttpUtil getInstance() {
    if (_instance == null) {
      _instance = HttpUtil._();
    }
    return _instance;
  }

  final String GET = 'GET'; // ignore: non_constant_identifier_names
  final String POST = 'POST'; // ignore: non_constant_identifier_names

  // get请求
  void get<T>(String url, Function successCallBack, {Map<String, String> params, Function errorCallBack}) {
    _request<T>(url, successCallBack, method: GET, params: params, errorCallBack: errorCallBack);
  }

  // post请求
  void post<T>(String url, Function successCallBack, {Map<String, dynamic> params, Function errorCallBack}) {
    _request<T>(url, successCallBack, method: POST, params: params, errorCallBack: errorCallBack);
  }

  // 请求部分
  void _request<T>(String url, Function callBack, {String method, Map<String, dynamic> params, Function errorCallBack}) async {
    String errorMsg = "";
    int statusCode;

    try {
      Response response;
      BaseOptions options = new BaseOptions(
          connectTimeout: 10000,
          receiveTimeout: 10000,
          baseUrl: Api.baseUrl,
          responseType: ResponseType.json,
          // dio库中默认将请求数据序列化为json，此处可根据后台情况自行修改
          contentType:
              new ContentType('application', 'json', charset: 'utf-8'));
      Dio dio = new Dio(options);

      if (method == GET) {
        response = await dio.get(url, queryParameters: params);
      } else {
        response = await dio.post(url, data: params);
      }
      statusCode = response.statusCode;
      //处理错误部分
      if (statusCode < 0) {
        errorMsg = "网络请求错误,状态码:" + statusCode.toString();
        _handError(errorCallBack, errorMsg);
        return;
      }

      if (callBack != null) {
        //print(response.statusCode);
        T result = EntityFactory.generateOBJ(JsonCodec().decode(response.data));
        callBack(result);
      }
    } catch (exception) {
      _handError(errorCallBack, exception.toString());
    }
  }

  // 处理异常
  void _handError(Function errorCallback, String errorMsg) {
    if (errorCallback != null) {
      errorCallback(errorMsg);
    }
  }
}
