import 'package:dio/dio.dart';
import 'package:quote_task/view_model/data/network/end_points.dart';

class DioHelper {
  static Dio? dio;

  static void intiState() {
    dio = Dio(BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {"Content-Type": "application/json"}));
  }

  static Future<Response> get(
      {required String endPoint,
      Map<String, dynamic>? body,
      Map<String, dynamic>? prams}) async {
    try {
      Response? response =
          await dio?.get(endPoint, data: body, queryParameters: prams);
      return response!;
    } catch (e) {
      rethrow;
    }
  }
}
