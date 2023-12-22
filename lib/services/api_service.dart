
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/toons_model.dart';

class ApiService {
  static const String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons()async  {
    List<WebtoonModel> webtoonModelList = [];
    var url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if(response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for(var webtoon in webtoons){
        final toon = WebtoonModel.fromJson(webtoon);
        webtoonModelList.add(toon);
      }
      return webtoonModelList;
    }else {
      throw Error();
    }
  }
}