
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina_task/core/utils/Colors.dart';
import 'package:promina_task/core/utils/components.dart';
import 'package:promina_task/core/utils/constants.dart';
import 'package:promina_task/features/my_gellary/presentation/screens/gallery_screen/gallery_screen.dart';
import 'package:promina_task/features/my_gellary/presentation/screens/login_screen/widgets/camera.dart';
import 'package:promina_task/features/my_gellary/presentation/screens/login_screen/widgets/login_body.dart';
import 'package:promina_task/logic/login_cubit/login_cubit.dart';
import 'package:promina_task/logic/login_cubit/login_states.dart';

import '../../../../../core/utils/helper.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state){
          if(state is LoginSuccessState){
            Components.navigateAndFinish(context: context, widget: GalleryScreen());
          }
        },
        builder:(context, state){
          return Scaffold(
            extendBodyBehindAppBar: true,
            body: Container(
              height: Helper.getScreenHeight(context: context),
              width: Helper.getScreenWidth(context: context),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      AppColors.firstLoginColor,
                      AppColors.secondLoginColor,
                      AppColors.thirdLoginColor,
                    ],
                    begin: Alignment.topRight,
                    stops: const [0.2, 0.4, 0.8],
                    end: Alignment.bottomLeft),
              ),
              child: Container(
                height: Helper.getScreenHeight(context: context),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CameraShape(),
                          LoginBody(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
