
import '../network_service.dart';

class TechnologiesModel {
  final String userName;
  final String? userProfileImageUrl;
  final List<Technology> technologies;

  const TechnologiesModel({
    required this.userName,
    required this.userProfileImageUrl,
    required this.technologies
  });

  factory TechnologiesModel.fromJson(Map<String, dynamic> json) => TechnologiesModel(
    userName: json["userName"] as String,
    userProfileImageUrl: (json["userProfileImageUrl"] as String?)?.replaceAll("localhost", NetworkService.wifiApi),
    technologies: List<Technology>.from(json["technologies"].map((e) => Technology.fromJson(e)))
  );

  Map<String, dynamic> get toJson => {
    "userName": userName,
    "userProfileImageUrl": userProfileImageUrl,
    "technologies": technologies.map((e) => e.toJson).toList()
  };
}

class Technology {
  final String id;
  final String title;
  final String imageUrl;

  const Technology({
    required this.id,
    required this.title,
    required this.imageUrl
  });

  factory Technology.fromJson(Map<String, dynamic> json) => Technology(
    id: json["id"] as String,
    imageUrl: (json["imageUrl"] as String).replaceAll("localhost", NetworkService.wifiApi),
    title: json["title"] as String
  );

  Map<String, dynamic> get toJson => {
    "id": id,
    "title": title,
    "imageUrl": imageUrl
  };
}
