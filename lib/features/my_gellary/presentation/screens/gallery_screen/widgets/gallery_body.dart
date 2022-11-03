import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promina_task/features/my_gellary/presentation/screens/gallery_screen/widgets/action_buttons.dart';
import 'package:promina_task/features/my_gellary/presentation/screens/gallery_screen/widgets/gallery_images.dart';
import 'package:promina_task/logic/gallery_cubit/gallery_cubit.dart';
import 'package:promina_task/logic/gallery_cubit/gallery_states.dart';

import '../../../../../../core/utils/Colors.dart';
import '../../../../../../core/utils/border_radius.dart';
import '../../../../../../core/utils/helper.dart';

class GalleryBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GalleryCubit, GalleryStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Expanded(
          child: Container(
            padding: EdgeInsets.only(
                left: Helper.getScreenWidth(context: context) * 0.08,
                right: Helper.getScreenWidth(context: context) * 0.08,
                top: Helper.getScreenHeight(context: context) * 0.06),
            width: Helper.getScreenWidth(context: context),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.thirdGalleryColor,
                  AppColors.secondGalleryColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(AppRadius.circular),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GalleryActionButtons(galleryFun: () {
                    GalleryCubit.get(context)
                        .pickImage(imageSource: ImageSource.gallery);
                  }, cameraFun: () {
                    GalleryCubit.get(context)
                        .pickImage(imageSource: ImageSource.camera);
                  }),
                  GalleryImages(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
