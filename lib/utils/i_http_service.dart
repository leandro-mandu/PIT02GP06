import 'package:shared_preferences/shared_preferences.dart';

abstract class IHttpService {
  Future<dynamic> get(String url);
  set(String url, dynamic data);
}
