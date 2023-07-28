class ModelPhotos {
  String imgSrc;
  String photoName;

  ModelPhotos({required this.photoName, required this.imgSrc});

  static ModelPhotos fromAPI2App(Map<String, dynamic> photoMap) {
    return ModelPhotos(
        photoName: photoMap["photographer"],
        imgSrc: (photoMap["src"])["portrait"]);
  }
}
