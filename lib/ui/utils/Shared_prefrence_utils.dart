
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceUtils {
 static late SharedPreferences sharedPrefrence;

  static init()async{
    sharedPrefrence = await SharedPreferences.getInstance();
  }
  static Object? getData({required String key}){
    return sharedPrefrence.get(key);
  }
  static Future<bool> SaveData({required String key, required dynamic value}) {
    if(value is int){
     return sharedPrefrence.setInt(key, value);
    }
    else if(value is String){
      return sharedPrefrence.setString(key, value);
    }
    else if(value is double){
      return sharedPrefrence.setDouble(key, value);
    }else{
      return sharedPrefrence.setBool(key, value);
    }
  }
}
