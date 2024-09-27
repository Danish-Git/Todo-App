import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/data_models/response.dart';

class ApiRequests {

  Duration requestTime = const Duration(seconds: 5);

  String internetConnectivityMessage = "Please check internet connectivity";
  String connectionTimeoutMessage = "Connection Timeout!\nPlease check internet connectivity";

  bool checkInternetConnectivity (String e) => e.toLowerCase().contains("SocketException".toLowerCase());
  Map<String, String> headers = {
    "Content-Type": "application/json"
  };

  Future<ApiResponse> get ({required String url}) async {
    return http.get(Uri.parse(url)).then((response) => ApiResponse(status: response.statusCode == 200, data: jsonDecode(response.body), message: response.statusCode == 200 ? response.statusCode.toString() : null))
      .onError((error, stackTrace) => ApiResponse(status: false, message: checkInternetConnectivity(error.toString()) ? internetConnectivityMessage : error.toString()))
      .catchError((error) => ApiResponse(status: false, message: checkInternetConnectivity(error.toString()) ? internetConnectivityMessage : error.toString()))
      .timeout(requestTime, onTimeout: () => ApiResponse(status: false, message: connectionTimeoutMessage));
  }

  Future<ApiResponse> put ({required String url, Map<String, dynamic>? params}) async {
    return http.put(Uri.parse(url), body: json.encode(params), headers: headers).then((response) => ApiResponse(status: response.statusCode == 200, data: jsonDecode(response.body), message: response.statusCode == 200 ? response.statusCode.toString() : null))
      .onError((error, stackTrace) => ApiResponse(status: false, message: checkInternetConnectivity(error.toString()) ? internetConnectivityMessage : error.toString()))
      .catchError((error) => ApiResponse(status: false, message: checkInternetConnectivity(error.toString()) ? internetConnectivityMessage : error.toString()))
      .timeout(requestTime, onTimeout: () => ApiResponse(status: false, message: connectionTimeoutMessage));
  }

  Future<ApiResponse> delete ({required String url}) async {
    return http.delete(Uri.parse(url), headers: headers).then((response) => ApiResponse(status: response.statusCode == 200, data: jsonDecode(response.body), message: response.statusCode == 200 ? response.statusCode.toString() : null))
      .onError((error, stackTrace) => ApiResponse(status: false, message: checkInternetConnectivity(error.toString()) ? internetConnectivityMessage : error.toString()))
      .catchError((error) => ApiResponse(status: false, message: checkInternetConnectivity(error.toString()) ? internetConnectivityMessage : error.toString()))
      .timeout(requestTime, onTimeout: () => ApiResponse(status: false, message: connectionTimeoutMessage));
  }

  Future<ApiResponse> post ({required String url, Map<String, dynamic>? params}) async {
    return http.post(Uri.parse(url), body: json.encode(params), headers: headers).then((response) => ApiResponse(status: response.statusCode == 201, data: jsonDecode(response.body), message: response.statusCode == 200 ? response.statusCode.toString() : null))
      .onError((error, stackTrace) => ApiResponse(status: false, message: checkInternetConnectivity(error.toString()) ? internetConnectivityMessage : error.toString()))
      .catchError((error) => ApiResponse(status: false, message: checkInternetConnectivity(error.toString()) ? internetConnectivityMessage : error.toString()))
      .timeout(requestTime, onTimeout: () => ApiResponse(status: false, message: connectionTimeoutMessage));
  }
}