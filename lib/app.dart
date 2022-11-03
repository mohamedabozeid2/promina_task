import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:promina_task/config/themes/light_theme.dart';
import 'package:promina_task/features/my_gellary/presentation/screens/gallery_screen/gallery_screen.dart';

import 'features/my_gellary/presentation/screens/login_screen/login_screen.dart';

class GalleryApp extends StatelessWidget {
  Widget startScreen;
  GalleryApp({required this.startScreen});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Gallery',
          theme: lightTheme,
          themeMode: ThemeMode.light,
          home: startScreen,
        );
      },
    );
  }
}