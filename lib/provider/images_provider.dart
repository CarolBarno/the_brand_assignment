import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:thebrandassignment/model/register_api.dart';

class Images {
  String title;
  String picture;
  String catalogId;
  String designId;

  Images({
    this.title,
    this.picture,
    this.catalogId,
    this.designId
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      title: json["title"],
      picture: json["picture"],
      catalogId: json["catalogid"].toString(),
      designId: json["id"].toString(),
    );
  }
}

List<Images> parseImages(responseBody) {
  final parse = responseBody.cast<Map<String, dynamic>>();

  var parsed = parse.map<Images>((json) => Images.fromJson(json)).toList();

  return parsed;
}

class ImagesProvider extends ChangeNotifier {
  ImagesProvider() {
    getImages();
  }

  Map<String, dynamic> decodeData;
  List list;

  bool _isFetching = false;

  bool get isFetching => _isFetching;

  Future<List<Images>> getImages() async {
    _isFetching = true;
    notifyListeners();

    var response;

    try {
      response = await getData(
              "http://itsthebrand.com/brandAPI/mode.php?mode=getThemes&userid=22&page=1")
          .timeout(const Duration(seconds: 30));

      print('images response ${response.body}');
      var body = json.decode(response.body);

      if (response.statusCode == 200) {
        decodeData = body;
        print('success images data $decodeData');
      } else {
        throw Exception('Error fetching data');
      }
    } on TimeoutException {
      print("Timeout exception");
    } on SocketException {
      print("Socket exception");
    }

    print("fetch images done");
    _isFetching = false;
    notifyListeners();
  }

  Map<String, dynamic> get getImagesList => decodeData;

  getImagesData() {
    if (decodeData == null) {
      print('data is null');
      return null;
    } else {
      list = parseImages(decodeData['themes']);
      return list;
    }
  }
}
