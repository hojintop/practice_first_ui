import 'package:flutter/material.dart';
import 'package:practice_toonflix/services/api_service.dart';
import 'package:practice_toonflix/widgets/webToon_widgets.dart';

import '../models/toons_model.dart';

class ToonHome extends StatelessWidget {
  ToonHome({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          if (futureData.hasData) {
            return Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: makeList(futureData),
                )
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> futureData) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: futureData.data!.length,
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      itemBuilder: (context, index) {
        var webtoon = futureData.data![index];
        return WebToonList(title: webtoon.title, id: webtoon.id, thumb: webtoon.thumb);
      },
      separatorBuilder: (context, index) => SizedBox(
        width: 40,
      ),
    );
  }
}
