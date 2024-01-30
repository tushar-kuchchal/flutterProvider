// ignore_for_file: prefer_interpolation_to_compose_strings
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_provider/screens/favourite/favorite_items.dart';
import 'package:http/http.dart';
class AuthProvider with ChangeNotifier{
  bool _loading=false;
  get loading=>_loading;

  void setLoading(bool value){
    _loading=value;
    notifyListeners();
  }

  void login(String email, String password, BuildContext context)async{
    setLoading(true);
    try{
      Response response=await post(Uri.parse('https://reqres.in/api/login'),
      body: {
        'email':email,
        'password':password
      });
      if(response.statusCode==200){
        print('LoginSuccfull========>>>>>>>>>');
        setLoading(false);
       Navigator.pushReplacement(context,MaterialPageRoute(builder: (ctx)=> Favoriteitems()));
       
      }
      else{
        print('Login failed ==========>>>>>>>>>>.');
        setLoading(false);
      }
      

    }
    catch(e){
      print('login error'+e.toString());
      setLoading(false);
    }
  }

}