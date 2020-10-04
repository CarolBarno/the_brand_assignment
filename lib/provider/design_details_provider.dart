import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:thebrandassignment/model/register_api.dart';

class DesignDetails {
  String title;
  String alias;
  String picture;
  String category;
  String public;
  String addDate;
  String viewNum;
  String description;

  DesignDetails({
    this.title,
    this.alias,
    this.picture,
    this.category,
    this.public,
    this.addDate,
    this.viewNum,
    this.description
  });

  factory DesignDetails.fromJson(Map<String, dynamic> json) {
    return DesignDetails(
      title: json["title"],
      alias: json["alias"],
      picture: json["picture"],
      category: json["category"].toString(),
      public: json["public"].toString(),
      addDate: json["adddate"].toString(),
      viewNum: json["viewnum"].toString(),
      description: json["description"]
    );
  }
}

List<DesignDetails> parseDesignDetails(responseBody) {
  final parse = responseBody.cast<Map<String, dynamic>>();

  var parsed = parse.map<DesignDetails>((json) => DesignDetails.fromJson(json)).toList();

  return parsed;
}

class DesignDetailsProvider extends ChangeNotifier {
//  DesignDetails() {
//  }

  Map<String, dynamic> decodeData;
  List list;

  bool _isFetching = false;

  bool get isFetching => _isFetching;

  Future<List<DesignDetails>> getDesignDetails(String catalogId, String designId) async {
    _isFetching = true;
    notifyListeners();

    var response;

    try {
      response = await getData(
          "http://itsthebrand.com/brandAPI/mode.php?mode=getDesignDetails&userid=$catalogId&designID=$designId")
          .timeout(const Duration(seconds: 30));

      print('details response ${response.body}');
      var body = json.decode(response.body);

      if (response.statusCode == 200) {
        decodeData = body;
        print('success details data $decodeData');
      } else {
        throw Exception('Error fetching data');
      }
    } on TimeoutException {
      print("Timeout exception");
    } on SocketException {
      print("Socket exception");
    }

    print("fetch details done");
    _isFetching = false;
    notifyListeners();
  }

  Map<String, dynamic> get getImagesList => decodeData;

  getDesignDetailsData() {
    if (decodeData == null) {
      print('data is null');
      return null;
    } else {
      list = parseDesignDetails(decodeData['designDetails']);
      return list;
    }
  }
}
