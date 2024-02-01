import 'package:dependency_injection/models/post_response_model.dart';
import 'package:dependency_injection/services/api_service.dart';
import 'package:get_it/get_it.dart';

//Step-1 creating instances
final locator = GetIt.instance;

//Step-2 create locator
void setUpLocator(){
  locator.registerLazySingleton(() => ApiService());
}