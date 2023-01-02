import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:u_finance/utils/i_http_service.dart';

class SharedPreferencesClient implements IHttpService {
  final SharedPreferences instance;
  SharedPreferencesClient({required this.instance});

  @override
  Future get(String url) async => instance.getString(url);

  @override
  set(String url, data) async => instance.setString(url, jsonEncode(data));
}
