import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:promina_task/config/themes/light_theme.dart';
import 'package:promina_task/logic/gallery_cubit/gallery_cubit.dart';

class GalleryApp extends StatelessWidget {
  Widget startScreen;
  GalleryApp({required this.startScreen});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(427, 1385),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Gallery',
          theme: lightTheme,
          themeMode: ThemeMode.light,

          home: child,
        );
      },
      child: startScreen,
    );
  }
}