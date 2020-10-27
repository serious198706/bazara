import 'package:dio/dio.dart';
import 'package:bazara/utils/constants.dart';
import 'package:bazara/utils/preference_utils.dart';

Future<String> request(Dio dio, String url, Map<String, dynamic> params) async {
  Response<String> result;

  String token = await readPreference<String>(PR_KEY_TOKEN);
  if (token != null)
    dio.options.headers = {'x-henzhun-token': token};

  if (token != null)
    print('Requesting URL: $url with data: $params, token is $token');
  else
    print('Requesting URL: $url with data: $params');

  await dio.post<String>(url, data: params).then((response) {
    result = response;
  }).catchError((_) {
    result = null;
  });

  print('Got result: $result');

  return result == null ? '{"code": -1, "msg": "网络错误！"}' : result.data;
}
