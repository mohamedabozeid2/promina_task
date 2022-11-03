import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promina_task/core/api/dio_helper.dart';
import 'package:promina_task/core/api/end_points.dart';
import 'package:promina_task/logic/gallery_cubit/gallery_states.dart';

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
      print("No image selected");
      emit(GalleryUploadImageErrorState());
    }
  }

  void uploadImage({required File file}) async {
    emit(GalleryUploadImageLoadingState());
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "img": await MultipartFile.fromFile(file.path, filename: fileName),
    });
    DioHelper.postData(
            url: EndPoints.uploadImage,
            data: formData,
            token: userLoginModel!.token)
        .then((value) {
          getGallery();
      // emit(GalleryUploadImageSuccessState());
    }).catchError((error) {
      print('Error in upload image ${error.toString()}');
      emit(GalleryUploadImageErrorState());
    });
  }

  void getGallery({bool fromUpload = false}) {
    if(!fromUpload){
      emit(GalleryGetImagesLoadingState());
    }
    DioHelper.getData(url: EndPoints.gallery, token: userLoginModel!.token)
        .then((value) {
      galleryDataModel = GalleryDataModel.fromJson(value.data);
      emit(GalleryGetImagesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GalleryGetImagesErrorState());
    });
  }
}
