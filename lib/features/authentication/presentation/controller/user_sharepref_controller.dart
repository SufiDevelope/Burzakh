import 'dart:convert';

import 'package:burzakh/constants/app_apis.dart';
import 'package:burzakh/features/authentication/presentation/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserShareprefController{
  Future<void> setData(UserModel model)async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    String data=jsonEncode(model.toJson());
    await pref.setString(AppApis.user, data);
  }

  Future<UserModel?> getData()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
   String? data= await pref.getString(AppApis.user);
   if(data!=null){
     var value=jsonDecode(data);
     UserModel model=UserModel.fromJson(value);
     return model;
   }else{
     return null;
   }
  }

  Future<void> makeNull()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    await pref.remove(AppApis.user);
  }


  Future<void> setFirstTime()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    await pref.setString(AppApis.isFirstTime, "1");
  }



  Future<int?> getFirstTime()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    String? data= await pref.getString(AppApis.isFirstTime);
    if(data!=null){
      var value=jsonDecode(data);
      return value;
    }else{
      return null;
    }
  }


}