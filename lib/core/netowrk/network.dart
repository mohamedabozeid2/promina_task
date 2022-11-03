import 'package:internet_connection_checker/internet_connection_checker.dart';

class CheckConnection{
  static Future<bool> checkConnection() async {
    bool internetConnection = await InternetConnectionChecker().hasConnection;
    return internetConnection;
  }
}
