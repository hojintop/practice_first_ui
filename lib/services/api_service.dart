
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practice_toonflix/models/toon_list_model.dart';

import '../models/toon_detail_model.dart';
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
        webtoonModelList.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonModelList;
    }else {
      throw Error();
    }
  }

  // 선택한 웹툰 상세정보 api 호출
  static Future<WebtoonDetailModel> getToonDetailById(String id) async{
    var url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if(response.statusCode == 200){
      return WebtoonDetailModel.fromJson(jsonDecode(response.body));
    }
    throw Error();
  }

  // 선택한 웹툰 회차 리스트 api 호출
  static Future<List<WebtoonDetailListModel>> getToonDetailListById(String id) async{
    List<WebtoonDetailListModel> webtoonDetailList = [];
    var url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if(response.statusCode == 200){
      final detailList = json.decode(response.body);
      for(var list in detailList){
        webtoonDetailList.add(WebtoonDetailListModel.fromJson(list));
      }
      return webtoonDetailList;
    }
    throw Error();
  }
}