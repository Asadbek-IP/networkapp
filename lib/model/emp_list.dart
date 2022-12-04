import 'model.dart';

class EmpList {
  String? status;
  String? message;
  List<Employee>? data;

   EmpList.fromjson(Map json){
    status = json['status'];
    message = json['message'];
    data = List<Employee>.from(json['data'].map((ishchi)=>Employee.fromJson(ishchi)));
   }

   Map toJson(){
    return {
      "status" :status,
      "message" : message,
      "data" : List<Employee>.from(data!.map((ishchi) => ishchi.toJson()))
    };
   }
}

