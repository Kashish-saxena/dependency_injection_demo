import 'package:dependency_injection/locator.dart';
import 'package:dependency_injection/models/post_response_model.dart';
import 'package:dependency_injection/services/api_service.dart';

// Step - 3
class PostController {
  static Future<List<PostResponseModel>> fetchData() async {
    return locator.get<ApiService>().fetchData();
  }
}
