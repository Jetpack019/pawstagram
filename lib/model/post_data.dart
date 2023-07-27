import 'dart:convert';

class PostData {
  final String avatar;
  final String username;
  final String location;
  final String caption;
  final String postImage;

  PostData(
      {required this.avatar,
      required this.username,
      required this.location,
      required this.postImage,
      required this.caption});

  factory PostData.fromJson(String jsonString) {
    final jsonData = json.decode(jsonString);
    return PostData(
      avatar: jsonData['avatar'],
      username: jsonData['username'],
      location: jsonData['location'],
      postImage: jsonData['postImage'],
      caption: jsonData['caption'],
    );
  }
}
