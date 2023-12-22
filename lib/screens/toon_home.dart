import 'package:flutter/material.dart';
import 'package:practice_toonflix/services/api_service.dart';

import '../models/toons_model.dart';

class ToonHome extends StatelessWidget {
  ToonHome({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        foregroundColor: Colors.green,
        title: Text(
          '오늘의 웹툰',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, futureData) {
          if(futureData.hasData){
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: futureData.data!.length,
              itemBuilder: (context,index){
                var webtoon = futureData.data![index];
                return Text(webtoon.title);
              },
              separatorBuilder: (context, index) => SizedBox(width: 20,),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
