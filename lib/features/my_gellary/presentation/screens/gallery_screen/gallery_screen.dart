import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina_task/core/hive/hive_helper.dart';
import 'package:promina_task/core/hive/hive_keys.dart';
import 'package:promina_task/core/utils/Colors.dart';
import 'package:promina_task/core/utils/components.dart';
import 'package:promina_task/core/utils/constants.dart';
import 'package:promina_task/core/widgets/adaptive_indicator.dart';
import 'package:promina_task/features/my_gellary/presentation/screens/gallery_screen/widgets/gallery_body.dart';
import 'package:promina_task/features/my_gellary/presentation/screens/gallery_screen/widgets/user_image_widget.dart';
import 'package:promina_task/features/my_gellary/presentation/screens/gallery_screen/widgets/welcome_widget.dart';
import 'package:promina_task/logic/gallery_cubit/gallery_cubit.dart';
import 'package:promina_task/logic/gallery_cubit/gallery_states.dart';

import '../../../../../core/utils/helper.dart';

class GalleryScreen extends StatefulWidget {
  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  void initState() {
    userLoginModel = HiveHelper.getUserModel(
        box: HiveHelper.userModel!, key: HiveKeys.userModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GalleryCubit()..getGallery(),
      child: BlocConsumer<GalleryCubit, GalleryStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              extendBodyBehindAppBar: true,
              body: Container(
                color: AppColors.firstGalleryColor,
                height: Helper.getScreenHeight(context: context),
                width: Helper.getScreenWidth(context: context),
                child: state is GalleryGetImagesLoadingState || state is GalleryUploadImageLoadingState
                    ? Center(
                        child: AdaptiveIndicator(
                        os: Components.getOS(),
                        color: Colors.white,
                      ))
                    : Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.firstGalleryColor),
                            height:
                                Helper.getScreenHeight(context: context) * 0.16,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                WelcomeWidget(),
                                UserImageWidget(),
                              ],
                            ),
                          ),
                          GalleryBody()
                        ],
                      ),
              ));
        },
      ),
    );
  }
}
