import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina_task/core/utils/components.dart';
import 'package:promina_task/core/widgets/adaptive_indicator.dart';
import 'package:promina_task/core/widgets/cached_image.dart';
import 'package:promina_task/logic/gallery_cubit/gallery_states.dart';

import '../../../../../../core/utils/border_radius.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/helper.dart';
import '../../../../../../logic/gallery_cubit/gallery_cubit.dart';

class GalleryImages extends StatelessWidget {
  const GalleryImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GalleryCubit, GalleryStates>(
      listener: (context, state){},
      builder: (context, state){
        return state is GalleryGetImagesLoadingState ? AdaptiveIndicator(os: Components.getOS()) : GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: Helper.getScreenHeight(context: context) * 0.03,
          crossAxisSpacing: Helper.getScreenWidth(context: context) * 0.06,
          childAspectRatio: 1 / 1.3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(galleryDataModel!.galleryData!.images.length,
                  (index) => galleryItemBuilder(index: index)),
        );
      },
    );
  }

  Widget galleryItemBuilder({required int index}) {
    return Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.large3)),
        child: CachedImage(
          image: galleryDataModel!.galleryData!.images[index],
          circularColor: Colors.white,
        ));
  }
}
