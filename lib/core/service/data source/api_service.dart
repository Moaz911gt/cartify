// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Api {
//   final Dio dio = Dio();
//   Future<dynamic> get({required String url, @required String? token}) async {
//     http.Response response = await http.get(Uri.parse(url));
//     Map<String, String> headers = {'Content-Type': 'application/json'};
//     if (token != null) {
//       headers.addAll({'Authorization': 'Bearer $token'});
//     }
//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       print(response.body.toString());
//       throw Exception(
//         'there is a problem with status code ${response.statusCode}',
//       );
//     }
//   }

//   Future<dynamic> post({
//     required String url,
//     @required dynamic body,
//     @required String? token,
//   }) async {
//     try {
//       Options options = Options(
//         headers: {
//           'Content-Type': 'application/json',
//           'X-API-KEY': 'c0e6795dda605e7e27b8c7524ea61fa8dbc6bb11',
//           if (token != null) 'Authorization': 'Bearer $token',
//         },
//       );

//       Response response = await dio.post(url, data: body, options: options);

//       return response.data;
//     } on DioException catch (e) {
//       print('POST error: ${e.response?.data}');
//       throw Exception('POST error: ${e.response?.statusCode}');
//     }
//   }

//   Future<dynamic> put({
//     required String url,
//     @required dynamic body,
//     @required String? token,
//   }) async {
//     Map<String, String> headers = {};
//     if (token != null) {
//       headers.addAll({'Authorization': 'Bearer $token'});
//     }
//     print('url = $url body = $body token = $token');
//     http.Response response = await http.post(
//       Uri.parse(url),
//       body: body,
//       headers: headers,
//     );
//     if (response.statusCode == 200) {
//       Map<String, dynamic> data = jsonDecode(response.body);
//       print(data);
//       return data;
//     } else {
//       throw Exception(
//         'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}',
//       );
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class ApiService {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://fakestoreapi.com/',
      ),
    );
  }

  static Future<Response> post({
    required String path,
    @required Map<String, dynamic>? query,
    @required Map<String,dynamic>? data,
  }) async {
    var res = await dio.post(path, queryParameters: query,data: data);
    return res;
  }

    static Future<Response> get({
    required String path,
    @required Map<String, dynamic>? query,
  }) async {
    var res = await dio.get(path, queryParameters: query);
    return res;
  }

}
