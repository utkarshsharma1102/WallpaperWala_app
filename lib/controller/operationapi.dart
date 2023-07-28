import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_wala/model/modelphotos.dart';

class OperationApi {
  static List<ModelPhotos> trendingWallpapers = [];
  static List<ModelPhotos> searchWallpaperList = [];
  static Future<List<ModelPhotos>> getTrendingWallpapers() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated"), headers: {
      "Authorization":
          "mqvCBp0bmIXQUBQfppOxooW6mxS44KSpZst9lrqwQHPSjzKADLtpaTRr"
    }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      photos.forEach((element) {
        trendingWallpapers.add(ModelPhotos.fromAPI2App(element));
      });
    });

    return trendingWallpapers;
  }

  static Future<List<ModelPhotos>> searchWallpapers(String query) async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"),
        headers: {
          "Authorization":
              "mqvCBp0bmIXQUBQfppOxooW6mxS44KSpZst9lrqwQHPSjzKADLtpaTRr"
        }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      searchWallpaperList.clear();
      photos.forEach((element) {
        searchWallpaperList.add(ModelPhotos.fromAPI2App(element));
      });
    });

    return searchWallpaperList;
  }
}
