
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons()async  {
    var url = Uri.parse('$baseUrl/$today');
    print(url);
    final response = await http.get(url);
    if(response.statusCode == 200) {
      print(response.body);
      return;
    }else {
      throw Error();
    }
  }
}