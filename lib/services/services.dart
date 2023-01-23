import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod2/model/user_model.dart';
class ApiServices{
  String endpoint= 'https://reqres.in/api/users?page=2';

  Future<List<UserModel>> getUsers() async {
    Response respose = await get(Uri.parse(endpoint));
    if(respose.statusCode == 200){
      final List result= jsonDecode(respose.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    }else{
      throw Exception(respose.reasonPhrase);
    }

  }

}

final userProvider = Provider<ApiServices>((ref)=>ApiServices());