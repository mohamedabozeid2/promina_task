import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:promina_task/core/api/dio_helper.dart';
import 'package:promina_task/core/api/end_points.dart';
import 'package:promina_task/core/hive/hive_helper.dart';
import 'package:promina_task/core/hive/hive_keys.dart';
import 'package:promina_task/core/netowrk/network.dart';
import 'package:promina_task/core/utils/components.dart';
import 'package:promina_task/features/my_gellary/data/data_models/user_login_model.dart';
import 'package:promina_task/logic/login_cubit/login_states.dart';

import '../../core/utils/Colors.dart';
import '../../core/utils/constants.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    CheckConnection.checkConnection().then((value) {
      if (value) {

        DioHelper.postData(
            url: EndPoints.login,
            data: {'email': email, 'password': password}).then((value) {
          HiveHelper.putUserModel(
            box: HiveHelper.userModel!,
            key: HiveKeys.userModel,
            user: UserLoginModel.fromJson(value.data),
          ).then((value) {
            HiveHelper.putLoginValue(
                box: HiveHelper.login!, key: HiveKeys.login, login: true);
            emit(LoginSuccessState());
          }).catchError((error) {
            debugPrint('Error in hive ${error.toString()}');
            emit(LoginErrorState(error: error.toString()));

          });
        }).catchError((error) {
          Components.showSnackBar(
            title: 'Gallery',
            message: 'Please Enter a valid data',
            backgroundColor: AppColors.secondLoginColor.withOpacity(0.7),
            textColor: Colors.white,
          );
          emit(LoginErrorState(error: error.toString()));
        });
      } else {
        Components.showSnackBar(
          title: 'Gallery',
          message: 'No Internet Connection',
          backgroundColor: AppColors.secondLoginColor.withOpacity(0.7),
          textColor: Colors.white,
        );
        emit(LoginErrorState());

      }
    });
  }
}
