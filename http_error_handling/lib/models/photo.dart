import 'package:http_error_handling/models/search.dart';

class PhotoSearch implements Search<Photo> {
  @override
  late int id;

  @override
  late List<Photo> data;

  PhotoSearch.fromJson(List<dynamic>? json) {
    data = [];

    if (json != null) {
      int counter = 0;

      for (var value in json) {
        id = counter++;
        data.add(Photo.fromJson(value));
      }
    }
  }
}

class Photo {
  late int id;
  late int albumId;
  late String title;
  late String url;
  late String thumbnailUrl;

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    albumId = json['albumId'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }
}
