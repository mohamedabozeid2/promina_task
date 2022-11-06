import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promina_task/core/api/dio_helper.dart';
import 'package:promina_task/core/api/end_points.dart';
import 'package:promina_task/core/hive/hive_helper.dart';
import 'package:promina_task/core/netowrk/network.dart';
import 'package:promina_task/core/utils/components.dart';
import 'package:promina_task/features/my_gellary/presentation/screens/login_screen/login_screen.dart';
import 'package:promina_task/logic/gallery_cubit/gallery_states.dart';

import '../../core/utils/Colors.dart';
import '../../core/utils/constants.dart';
import '../../features/my_gellary/data/data_models/gallery_data_model.dart';

class GalleryCubit extends Cubit<GalleryStates> {
  GalleryCubit() : super(GalleryInitialState());

  static GalleryCubit get(context) => BlocProvider.of(context);

  File? image;
  var picker = ImagePicker();

  Future<void> pickImage({required ImageSource imageSource}) async {
    final pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      uploadImage(file: image!);
    } else {
      debugPrint("No image selected");
      emit(GalleryUploadImageErrorState());
    }
  }

  void uploadImage({required File file}) async {
    emit(GalleryUploadImageLoadingState());
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "img": await MultipartFile.fromFile(file.path, filename: fileName),
    });
    CheckConnection.checkConnection().then((value) {
      if (value) {
        DioHelper.postData(
                url: EndPoints.uploadImage,
                data: formData,
                token: userLoginModel!.token)
            .then((value) {
          getGallery();
          // emit(GalleryUploadImageSuccessState());
        }).catchError((error) {
          debugPrint('Error in upload image ${error.toString()}');
          emit(GalleryUploadImageErrorState());
        });
      } else {
        Components.showSnackBar(
          title: 'Gallery',
          message: 'No Internet Connection',
          backgroundColor: AppColors.secondLoginColor.withOpacity(0.7),
          textColor: Colors.white,
        );
        emit(GalleryUploadImageErrorState());
      }
    });
  }

  Future getGallery({bool fromUpload = false}) async{
    if (!fromUpload) {
      emit(GalleryGetImagesLoadingState());
    }
    CheckConnection.checkConnection().then((value) async{
      if (value) {
         await DioHelper.getData(url: EndPoints.gallery, token: userLoginModel!.token)
            .then((value) {
           emit(GalleryGetImagesSuccessState());
           galleryDataModel = GalleryDataModel.fromJson(value.data);
          // galleryDataModel = GalleryDataModel.fromJson(value.data);
        }).catchError((error) {
          debugPrint(error.toString());
          emit(GalleryGetImagesErrorState());
        });
      } else {
        print("VAlue is no");
        Components.showSnackBar(
          title: 'Gallery',
          message: 'No Internet Connection',
          backgroundColor: AppColors.secondLoginColor.withOpacity(0.7),
          textColor: Colors.white,
        );
        emit(GalleryGetImagesErrorState());
      }
    });
  }

  void signOut({required BuildContext context}) {
    HiveHelper.signOut();
    Components.navigateAndFinish(context: context, widget: LoginScreen());
  }
}
