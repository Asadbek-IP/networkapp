import 'package:http/http.dart';

class Network{
   static String BASE = "jsonplaceholder.typicode.com";
   static Map<String,String> headers = {'Content-Type': 'application/json; charset=UTF-8'};

   static String apiList = '/posts';

   static Future<String> GET(String api, Map<String,dynamic> params)async{

         var uri = Uri.https(BASE,api,params);

         var response = await get(uri,headers: headers);

         if(response.statusCode == 200){
          return response.body;
         }
         return "Xatoo";
   }

}