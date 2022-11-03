import 'package:flutter/material.dart';

import '../../../../../../core/utils/Colors.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/utils/border_radius.dart';
import '../../../../../../core/utils/helper.dart';

class UserImageWidget extends StatelessWidget {
  const UserImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.thirdGalleryColor,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.firstGalleryColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(AppRadius.largeCircular))),
            width: Helper.getScreenWidth(context: context) * 0.25,
            height: Helper.getScreenHeight(context: context) * 0.15,
            child: Image.asset(ImageAssets.user),
          ),
        ],
      ),
    );
  }
}
