import 'package:flutter/material.dart';
import 'package:practice_toonflix/services/api_service.dart';

import '../models/toon_detail_model.dart';
import '../models/toon_list_model.dart';

class WebtoonDetail extends StatefulWidget {
  final String id, title, thumb;

  const WebtoonDetail({
    super.key,
    required this.id,
    required this.title,
    required this.thumb,
  });

  @override
  State<WebtoonDetail> createState() => _WebtoonDetailState();
}

class _WebtoonDetailState extends State<WebtoonDetail> {
  late Future<WebtoonDetailModel> toonDetail;
  late Future<List<WebtoonDetailListModel>> toonDetailList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    toonDetail = ApiService.getToonDetailById(widget.id);
    toonDetailList = ApiService.getToonDetailListById(widget.id);
  }

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
          widget.title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: widget.id,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        offset: Offset(10, 10),
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ],
                  ),
                  width: 250,
                  child: Image.network(
                    widget.thumb,
                    headers: const {
                      "User-Agent":
                          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          FutureBuilder(
            future: toonDetail,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                  ),
                  child: Column(
                    children: [
                      Text(
                        snapshot.data!.about,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '${snapshot.data!.genre} / ${snapshot.data!.age}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: LinearProgressIndicator(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
