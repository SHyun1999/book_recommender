import 'package:http/http.dart' as http;
import 'dart:convert';

class Recommend{

  Future<List> RecommendBooks(var body) async {

    var client = new http.Client();
    var uri = Uri.parse("https://api-book-rec-last.herokuapp.com/RecommendBooks");


    Map<String, String> headers = {"Content-type": "application/json"};
    String jsonString = json.encode(body);


    try {
      var resp = await client.post(uri, headers: headers, body: jsonString);

      if (resp.statusCode == 200) {

        var result = await json.decode(resp.body);
        return result;

      }
    } catch (e) {
      print("EXCEPTION OCCURRED: $e");
      return [];
    }
    return [];


  }


}
