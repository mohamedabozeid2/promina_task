import 'package:hive_flutter/adapters.dart';
import 'package:promina_task/features/my_gellary/data/data_models/user_data_model.dart';
import 'package:promina_task/features/my_gellary/data/data_models/user_login_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'hive_keys.dart';

class HiveHelper{
  static Box<UserLoginModel>? userModel;
  static Box<bool>? login;

  static Future<void> init() async {
    await Hive.initFlutter();

    //// Register Adapter
    Hive.registerAdapter(UserLoginModelAdapter());
    Hive.registerAdapter(UserDataModelAdapter());


    //// Open Boxes
    userModel = await Hive.openBox<UserLoginModel>(HiveKeys.userModel);
    login = await Hive.openBox<bool>(HiveKeys.login);

  }

  static Future<void> putUserModel({
    required Box box,
    required String key,
    required UserLoginModel user,
  }) async {
    return await box.put(key, user);
  }

  static UserLoginModel getUserModel({
    required Box box,
    required String key,
  }) {
    return box.get(key);
  }


  static Future<void> putLoginValue({
    required Box box,
    required String key,
    required bool login,
  }) async {
    return await box.put(key, login);
  }

  static bool getLoginValue({
    required Box box,
    required String key,
  }) {
    return box.get(key, defaultValue: false);
  }

}