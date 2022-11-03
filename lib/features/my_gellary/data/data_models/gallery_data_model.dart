class GalleryDataModel{
  GalleryData? galleryData;

  GalleryDataModel.fromJson(Map<String, dynamic> json){
    galleryData = GalleryData.fromJson(json['data']);
  }
}

class GalleryData{
  List<String> images = [];

  GalleryData.fromJson(Map<String, dynamic> json){
    json['images'].forEach((element){
      images.add(element);
    });
  }
}