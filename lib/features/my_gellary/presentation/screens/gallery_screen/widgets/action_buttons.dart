import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promina_task/features/my_gellary/presentation/screens/gallery_screen/widgets/image_picker_dialog.dart';
import 'package:promina_task/logic/gallery_cubit/gallery_cubit.dart';

import '../../../../../../core/utils/Colors.dart';
import '../../../../../../core/utils/border_radius.dart';
import '../../../../../../core/utils/helper.dart';
import '../../../../../../core/utils/strings.dart';

class GalleryActionButtons extends StatelessWidget {
  var galleryFun;
  var cameraFun;

  GalleryActionButtons({required this.galleryFun, required this.cameraFun});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: (){
            GalleryCubit.get(context).signOut(context: context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: Helper.getScreenHeight(context: context) * 0.008,
              horizontal: Helper.getScreenWidth(context: context) * 0.04,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.large1),
                color: Colors.white),
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.all(
                        Helper.getScreenHeight(context: context) * 0.008),
                    decoration: BoxDecoration(
                        color: AppColors.logoutButton,
                        borderRadius: BorderRadius.circular(AppRadius.medium3)),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: Helper.getScreenWidth(context: context) * 0.025,
                ),
                Text(
                  AppStrings.logout,
                  style: Theme.of(context).textTheme.bodyText2,
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.defaultDialog(
              radius: AppRadius.large3,
              backgroundColor: Colors.white.withOpacity(0.3),
              title: "",
              contentPadding: EdgeInsets.symmetric(
                  vertical: Helper.getScreenHeight(context: context) * 0.01,
                  horizontal: Helper.getScreenWidth(context: context) * 0.05),
              content: ImagePickerDialog(
                galleryFun: galleryFun,
                cameraFun: cameraFun,
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: Helper.getScreenHeight(context: context) * 0.008,
              horizontal: Helper.getScreenWidth(context: context) * 0.04,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.large1),
                color: Colors.white),
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.all(
                        Helper.getScreenHeight(context: context) * 0.008),
                    decoration: BoxDecoration(
                        color: AppColors.uploadButton,
                        borderRadius: BorderRadius.circular(AppRadius.medium3)),
                    child: const Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: Helper.getScreenWidth(context: context) * 0.025,
                ),
                Text(
                  AppStrings.upload,
                  style: Theme.of(context).textTheme.bodyText2,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
