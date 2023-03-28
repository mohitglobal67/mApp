import 'package:bhart_app/networking/api_privider.dart';
import 'package:bhart_app/networking/network_constant.dart';

class HomeRepository {
  static String END_POINT = "/route-get";
  ApiProvider apiProvider = new ApiProvider();
  Future<dynamic> gethome() async {
    var res = await apiProvider.getMethod();
    return res;
  }

  Future<dynamic> postRegistration(Map<String, String> parameter) async {
    final response = await apiProvider.postBeforeAuth(parameter, "/route-get");
    return response; //GetApplicationDetailsResponse.fromJson(response);
  }
}
