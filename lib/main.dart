import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promina_task/core/hive/hive_keys.dart';
import 'package:promina_task/features/my_gellary/presentation/screens/gallery_screen/gallery_screen.dart';
import 'package:promina_task/features/my_gellary/presentation/screens/login_screen/login_screen.dart';
import 'app.dart';
import 'core/api/dio_helper.dart';
import 'core/hive/hive_helper.dart';
import 'core/netowrk/network.dart';
import 'core/utils/constants.dart';
import 'features/my_gellary/presentation/cubit/BlocObserver/BlocObserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await HiveHelper.init();

  Widget startWidget;

  bool login = HiveHelper.getLoginValue(box: HiveHelper.login!, key: HiveKeys.login);
  if(login == false){
    startWidget = LoginScreen();
  }else{
    startWidget = GalleryScreen();
  }

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark
      ));

  await CheckConnection.checkConnection().then((value) {
    internetConnection = value;
  });

  BlocOverrides.runZoned(
    () {
      runApp(GalleryApp(startScreen: startWidget,));
    },
    blocObserver: MyBlocObserver(),
  );
}
