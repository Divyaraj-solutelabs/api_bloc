import 'package:dio/dio.dart';



class Apiprovider{
  final Dio _dio = Dio();
  final String _url ='https://jsonplaceholder.typicode.com/comments';

  Future<Response ?> getPostData() async{
    try{
      Response response = await _dio.get(_url);
      return response;
    }
    catch(error, stacktrace){
      print("Exception occurred: $error stacktrace: $stacktrace");

    }
  }

}