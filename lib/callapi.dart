import 'package:http/http.dart' as http;

class CallApi {
  final String _url = 'https://jsonplaceholder.typicode.com';

  getArticleData(apiUrl) async {
    http.Response response = await http.get(Uri.parse(_url + apiUrl));
    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        return 'failed';
      }
    } catch (e) {
      return 'failed';
    }
  }
}
