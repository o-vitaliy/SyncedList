import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

import 'api_exception.dart';

typedef ExecuteApi = Future<dynamic> Function();

class NetworkCommon {
  final String _baseUrl;
  final JsonDecoder _decoder = new JsonDecoder();

  NetworkCommon(this._baseUrl);

  dynamic decodeResp(d) {
    // ignore: cast_to_non_type
    if (d is Response) {
      final dynamic jsonBody = d.data;
      final statusCode = d.statusCode;

      if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
        throw new Exception("statusCode: $statusCode");
      }

      if (jsonBody is String) {
        return _decoder.convert(jsonBody);
      } else {
        return jsonBody;
      }
    } else {
      throw d;
    }
  }

  BaseOptions get _options {
    return BaseOptions(baseUrl: _baseUrl);
  }

  Dio get _dio {
    Dio dio = new Dio(_options);

    return dio;
  }

  Future<dynamic> post(String path, {data: dynamic}) {
    return _execute(() => _dio.post(path, data: data));
  }

  Future<dynamic> get(String path, {Map<String, dynamic> queryParameters}) {
    return _execute(() => _dio.get(path, queryParameters: queryParameters));
  }

  Future<dynamic> _execute(ExecuteApi call) async {
    try {
      return await call();
    } catch (e) {
      if (e is DioError) {
        final data = e.response.data;
        final String errors =
            Map<String, dynamic>.from(data).values.expand((v) {
          if (v is String)
            return List.of([v]);
          else
            return List<String>.from(v.map((e) => e as String));
        }).join(", ");
        throw ApiException(errors);
      } else {
        throw e;
      }
    }
  }
}
/*
dio.interceptors
    .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
/// Do something before request is sent
/// set the token
SharedPreferences prefs = await SharedPreferences.getInstance();
String token = prefs.getString('token');
if (token != null) {
options.headers["Authorization"] = "Bearer " + token;
}

print("Pre request:${options.method},${options.baseUrl}${options.path}");
print("Pre request:${options.headers.toString()}");

return options; //continue
}, onResponse: (Response response) async {
// Do something with response data
final int statusCode = response.statusCode;
if (statusCode == 200) {
if (response.request.path == "login/") {
final SharedPreferences prefs = await SharedPreferences.getInstance();

final String jsonBody = response.data;
final JsonDecoder _decoder = new JsonDecoder();
final resultContainer = _decoder.convert(jsonBody);
final int code = resultContainer['code'];
if (code == 0) {
final Map results = resultContainer['data'];
prefs.setString("token", results["token"]);
prefs.setInt("expired", results["expired"]);
}
}
} else if (statusCode == 401) {
/// token expired, re-login or refresh token
final SharedPreferences prefs = await SharedPreferences.getInstance();
var username = prefs.getString("username");
var password = prefs.getString("password");
FormData formData = new FormData.from({
"username": username,
"password": password,
});
new Dio().post("login/", data: formData).then((resp) {
final String jsonBody = response.data;
final JsonDecoder _decoder = new JsonDecoder();
final resultContainer = _decoder.convert(jsonBody);
final int code = resultContainer['code'];
if (code == 0) {
final Map results = resultContainer['data'];
prefs.setString("token", results["token"]);
prefs.setInt("expired", results["expired"]);

RequestOptions ro = response.request;
ro.headers["Authorization"] = "Bearer ${prefs.getString('token')}";
return ro;
} else {
throw Exception("Exception in re-login");
}
});
}

print(
"Response From:${response.request.method},${response.request.baseUrl}${response.request.path}");
print("Response From:${response.toString()}");
return response; // continue
}, onError: (DioError e) {
// Do something with response error
return e; //continue
}));*/
