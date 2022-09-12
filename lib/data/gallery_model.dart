class GalleryModel {
  final String id;
  final String image;
  final String like;

  const GalleryModel({
    required this.id,
    required this.image,
    required this.like,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
        id: json['id'],
        image: json['image'],
        like: json['like'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'like': like,
      };
}
