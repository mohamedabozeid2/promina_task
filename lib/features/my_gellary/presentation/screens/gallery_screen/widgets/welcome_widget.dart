import 'package:flutter/material.dart';

import '../../../../../../core/utils/Colors.dart';
import '../../../../../../core/utils/border_radius.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/helper.dart';
import '../../../../../../core/utils/strings.dart';

class WelcomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: Helper.getScreenHeight(context: context) * 0.16,
        decoration: BoxDecoration(
            color: AppColors.thirdGalleryColor,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(AppRadius.largeCircular))),
        padding: EdgeInsets.only(
          left: Helper.getScreenWidth(context: context) * 0.04,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                height: Helper.getScreenHeight(context: context) * 0.1,
                child: Text(
                  '${AppStrings.welcome}\n ${userLoginModel!.userDataModel!.name}',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
