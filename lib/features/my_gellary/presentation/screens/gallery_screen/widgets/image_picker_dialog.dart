import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/utils/Colors.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/utils/border_radius.dart';
import '../../../../../../core/utils/helper.dart';
import '../../../../../../core/utils/strings.dart';

class ImagePickerDialog extends StatelessWidget {
  var galleryFun;
  var cameraFun;

  ImagePickerDialog({required this.galleryFun, required this.cameraFun});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: galleryFun,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.secondGalleryColor,
                  borderRadius: BorderRadius.circular(AppRadius.large3)),
              padding:
                  EdgeInsets.all(Helper.getScreenHeight(context: context) * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(ImageAssets.galleryLogo),
                  Text(
                    AppStrings.gallery,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 26),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Helper.getScreenHeight(context: context) * 0.04,
          ),
          GestureDetector(
            onTap: cameraFun,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.thirdGalleryColor,
                  borderRadius: BorderRadius.circular(AppRadius.large3)),
              padding: EdgeInsets.symmetric(
                  horizontal: Helper.getScreenWidth(context: context) * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(ImageAssets.cameraLogo),
                  Text(
                    AppStrings.camera,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 26),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
