import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:thebrandassignment/model/register_api.dart';

class DesignText {
  var text;

  DesignText({
    this.text,
  });

  factory DesignText.fromJson(Map<String, dynamic> json) {
    return DesignText(
      text: json["layers"],
    );
  }
}

List<DesignText> parseDesignText(responseBody) {
  final parse = responseBody.cast<Map<String, dynamic>>();

  var parsed = parse.map<DesignText>((json) => DesignText.fromJson(json)).toList();

  return parsed;
}

class DesignTextProvider extends ChangeNotifier {

  Map<String, dynamic> decodeData;
  List list;

  bool _isFetching = false;

  bool get isFetching => _isFetching;

  Future<List<DesignText>> getDesignText(String designId) async {
    _isFetching = true;
    notifyListeners();

    var response;

    try {
      response = await getData(
          "http://itsthebrand.com/brandAPI/mode.php?mode=getDesignForm&userid=4343&designID=$designId")
          .timeout(const Duration(seconds: 30));

      print('texts response ${response.body}');
      var body = json.decode(response.body);

      if (response.statusCode == 200) {
        decodeData = body;
        print('success text data $decodeData');
      } else {
        throw Exception('Error fetching data');
      }
    } on TimeoutException {
      print("Timeout exception");
    } on SocketException {
      print("Socket exception");
    }

    print("fetch text done");
    _isFetching = false;
    notifyListeners();
  }

  Map<String, dynamic> get getImagesList => decodeData;

  getDesignTextData() {
    if (decodeData == null) {
      print('data is null');
      return null;
    } else {
      list = parseDesignText(decodeData['designDetails']);
      return list;
    }
  }
}
