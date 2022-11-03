import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina_task/core/utils/components.dart';
import 'package:promina_task/core/widgets/adaptive_indicator.dart';
import 'package:promina_task/features/my_gellary/presentation/screens/login_screen/widgets/sizedBox.dart';
import 'package:promina_task/logic/login_cubit/login_cubit.dart';
import 'package:promina_task/logic/login_cubit/login_states.dart';

import '../../../../../../core/utils/Colors.dart';
import '../../../../../../core/utils/app_fonts.dart';
import '../../../../../../core/utils/border_radius.dart';
import '../../../../../../core/utils/helper.dart';
import '../../../../../../core/utils/strings.dart';
import '../../../../../../core/widgets/button.dart';
import '../../../../../../core/widgets/text_field.dart';

class LoginBody extends StatefulWidget {
  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          transform: Matrix4.translationValues(
            0.0,
            -Helper.getScreenHeight(context: context) * 0.16,
            0.0,
          ),
          child: Column(
            children: [
              Text(
                AppStrings.myGallery,
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: Helper.getScreenHeight(context: context) * 0.05,
                    horizontal: Helper.getScreenWidth(context: context) * 0.1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.circular),
                  color: Colors.white.withOpacity(0.7),
                  gradient: LinearGradient(
                      colors: [
                        AppColors.secondLoginColor,
                        AppColors.thirdLoginColor,
                        Colors.white,
                        AppColors.secondLoginColor,
                      ],
                      begin: AlignmentDirectional.topStart,
                      stops: const [
                        0.2,
                        0.4,
                        0.8,
                        1,
                      ]),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                          Helper.getScreenHeight(context: context) * 0.03),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppRadius.large2),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.login,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const DefaultSizedBox(),
                          DefaultTextField(
                            context: context,
                            controller: userNameController,
                            type: TextInputType.emailAddress,
                            label: AppStrings.userName,
                            borderColor: Colors.transparent,
                            fillColor: Colors.white,
                            borderRadius: AppRadius.circular,
                          ),
                          const DefaultSizedBox(),
                          DefaultTextField(
                            context: context,
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            label: AppStrings.password,
                            borderColor: Colors.transparent,
                            isPassword: true,
                            fillColor: Colors.white,
                            borderRadius: AppRadius.circular,
                          ),
                          const DefaultSizedBox(),
                          state is LoginLoadingState ? Center(child: AdaptiveIndicator(os: Components.getOS(),color: AppColors.secondGalleryColor,)) : DefaultButton(
                              fun: () {
                                if (userNameController.text.isNotEmpty &&
                                    passwordController.text.isNotEmpty) {
                                  LoginCubit.get(context).userLogin(
                                      email: userNameController.text,
                                      password: passwordController.text);
                                } else if (userNameController.text.isEmpty) {
                                  Components.showSnackBar(
                                      title: 'Gallery',
                                      message: 'Please enter your email',
                                      backgroundColor: AppColors.secondLoginColor.withOpacity(0.7),
                                      textColor: Colors.white);
                                }else{
                                  Components.showSnackBar(
                                      title: 'Gallery',
                                      message: 'Please enter your password',
                                      backgroundColor: AppColors.secondLoginColor.withOpacity(0.7),
                                      textColor: Colors.white);
                                }
                              },
                              text: AppStrings.submit,
                              height: Helper.getScreenHeight(context: context) *
                                  0.07,
                              fontSize: AppFontSize.s18,
                              textColor: Colors.white,
                              backgroundColor: AppColors.buttonColor,
                              borderRadius: AppRadius.medium2)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
