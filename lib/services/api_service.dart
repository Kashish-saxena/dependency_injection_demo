import 'package:dependency_injection/models/post_response_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<PostResponseModel>> fetchData() async {
    List<PostResponseModel> posts;
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    posts = postModelFromJson(response.body);
    return posts;
  }
}
