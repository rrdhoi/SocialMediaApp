class PostModel {
  final String name;
  final String imgProfile;
  final String picture;
  final String caption;
  final List<String> hashtags;
  final String like;
  final String comment;
  final String share;

  const PostModel({
    required this.name,
    required this.imgProfile,
    required this.picture,
    required this.caption,
    required this.hashtags,
    required this.like,
    required this.comment,
    required this.share,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        name: json['name'],
        imgProfile: json['imgProfile'],
        picture: json['picture'],
        caption: json['caption'],
        hashtags: List<String>.from(json["hashtag"].map((x) => x)),
        like: json['like'],
        comment: json['comment'],
        share: json['share'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'imgProfile': imgProfile,
        'picture': picture,
        'caption': caption,
        'hashtag': hashtags,
        'like': like,
        'comment': comment,
        'share': share,
      };
}
