
import 'package:http/http.dart' as http;

var accessToken;

Future<dynamic> getData(apiUrl) async {
  var fullUrl = apiUrl;
  return await http.get(fullUrl);
}
