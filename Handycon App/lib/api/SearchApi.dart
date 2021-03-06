import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Fcapi.dart';
import 'package:handycon/constants.dart';

Future<FcJdata> fetchSearchdata(String search) async
{
  final response = await http.get(
      Uri.parse(url+"/search?facName="+search),
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      }
  );
  if (response.statusCode == 200)
  {
    String jsonData = response.body;

    print("check retun of response");
    print(response.body);

    return FcJdata.fromJson(jsonDecode(jsonData));
  } else
  {
    throw Exception('Failed to load data');
  }
}


