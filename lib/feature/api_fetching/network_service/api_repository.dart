import 'apiprovider.dart';
import 'package:api_bloc/feature/api_fetching/model/model.dart';

class Apirepository{


   final Apiprovider apiprovider;
   const Apirepository({
    required this.apiprovider
});
  Future<List<Comment>?> getCommetList() async{
   final response =await  apiprovider.getPostData();
   if(response != null){
     final data = response.data as List<dynamic>;
     return data.map((singleComment) => Comment.fromJson(singleComment)).toList();
   }

  }
}

class NetworkError extends Error{}
