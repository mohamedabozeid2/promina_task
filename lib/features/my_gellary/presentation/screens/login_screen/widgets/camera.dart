import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/utils/helper.dart';

class CameraShape extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(
          -Helper.getScreenWidth(context: context) * 0.23,
          -Helper.getScreenHeight(context: context) * 0.16),
      child: Container(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(ImageAssets.vector1),
                Image.asset(ImageAssets.vector2),
                Image.asset(ImageAssets.vector3),
                Image.asset(ImageAssets.vector4),
                Image.asset(ImageAssets.vector5),
                Image.asset(ImageAssets.vector6),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom:
                Helper.getScreenHeight(context: context) *
                    0.05,
                right: Helper.getScreenWidth(context: context) *
                    0.18,
              ),
              child: Image.asset(ImageAssets.camera),
            ),
          ],
        ),
      ),
    );
  }
}
