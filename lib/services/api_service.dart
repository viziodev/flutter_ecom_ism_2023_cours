import 'package:dio/dio.dart';

import 'api_url_service.dart';

class ApiService {
  static final dio = Dio();
  //GET
  static Future<Response> getData(String path) async{
   //On construit l'url
     String url = ApiUrl.baseURL+ path;
     //Appel Asynchrone
     final response = await dio.get(url);
      
   if (response.statusCode == 200) {
      return response;
   } else {
     throw response;
  }

  }
  //POST

 
  //DELETE
}
