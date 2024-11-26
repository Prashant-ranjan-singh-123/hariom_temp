
import 'package:hariom/services/shared_pref/shared_pref_variable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceLogic{
  static Future<bool> isLogIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? isLogIn = pref.getBool(AppSharedPreferenceConst.instance().isLogin);
    if (isLogIn == null) {
      pref.setBool(AppSharedPreferenceConst.instance().isLogin, false);
      return false;
    } else {
      return isLogIn;
    }
  }

  static Future<void> setLoginFalse() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(AppSharedPreferenceConst.instance().isLogin, false);
    pref.remove(AppSharedPreferenceConst.instance().isLogin);
  }

  static Future<void> setLoginTrue({required String email}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(AppSharedPreferenceConst.instance().email, email);
    pref.setBool(AppSharedPreferenceConst.instance().isLogin, true);
  }

  static Future<String?> getEmail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? email = pref.getString(AppSharedPreferenceConst.instance().email);
    return email;
  }
}