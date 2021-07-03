import 'package:dio/dio.dart';
import '../models/User.dart';
import '../models/LoginData.dart';
import '../models/SignUpData.dart';
import './LocalStorage.dart';

class AuthService {
  static Future<User> login(LoginData data) async {
    final dio = Dio();
    try {
      final response =
          await dio.post('http://localhost:3000/login', data: data.toJson());
      if (response.statusCode == 200) {
        final User user = User.fromJson(response.data);
        await LocalStorage.setString('token', user.accessToken!);
        return user;
      }
      throw Exception('Invalid Credential');
    } on DioError catch (e) {
      throw Exception('Invalid Credential');
    }
  }

  static Future<User> signUp(SignUpData data) async {
    final dio = Dio();
    try {
      final response =
          await dio.post('http://localhost:3000/signup', data: data.toJson());
      if (response.statusCode == 200) {
        final User user = User.fromJson(response.data);
        await LocalStorage.setString('token', user.accessToken!);
        return user;
      }
      throw Exception('Invalid data');
    } on DioError catch (e) {
      throw Exception('Invalid data');
    }
  }
}
