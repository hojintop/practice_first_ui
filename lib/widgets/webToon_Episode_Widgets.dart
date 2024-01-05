import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../models/toon_list_model.dart';

class WebtoonEpisode extends StatelessWidget {
  final String webtoonId;
  WebtoonEpisode({
    super.key,
    required this.toonList,
    required this.webtoonId,
  });

  final WebtoonDetailListModel toonList;

  onToonTap() async {
    await launchUrlString("https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${int.parse(toonList.id)}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToonTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green.shade400,
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 5),
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                toonList.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Icon(Icons.chevron_right_rounded, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
