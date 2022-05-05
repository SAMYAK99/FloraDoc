import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static SharedPreferences _prefs;
  static String _userId = "userId";
  static String _userToken = "userToken";
  static String _isLogin = "isLogin";
  static String _userName = "userName";
  static String _profilePic = "profilePic";
  static String _phoneNumber = 'phone';

  // Generating Token for FCM
  static String _fcmtoken = 'fcmtoken';

  static setfcmToken(String s) {
    _prefs.setString(_fcmtoken, s);
  }

  static getfcmToken() {
    return _prefs.getString(_fcmtoken) ?? '';
  }

  static init() async {
    // print("-------Initialized");
    _prefs = await SharedPreferences.getInstance();
  }

  static logout() async {
    await _prefs.clear();
  }

  static String setIsLogin(bool b) {
    _prefs.setBool(_isLogin, b);
  }

  static getIsLogin() {
    return _prefs.getBool(_isLogin) ?? false;
  }

  static setPhoneNumber(String s) {
    _prefs.setString(_phoneNumber, s);
  }

  static getPhoneNumber() {
    return _prefs.getString(_phoneNumber) ?? '';
  }

  static setUserId(String s) {
    _prefs.setString(_userId, s);
  }

  static getUserId() {
    return _prefs.getString(_userId) ?? '';
  }

  static setUserToken(String s) {
    _prefs.setString(_userToken, s);
  }

  static getUserToken() {
    return _prefs.getString(_userToken) ?? '';
  }

  static setUserName(String s) {
    _prefs.setString(_userName, s);
  }

  static getUserName() {
    return _prefs.getString(_userName) ?? '';
  }

  static setProfilePic(String s) {
    _prefs.setString(_profilePic, s);
  }

  static getProfilePic() {
    return _prefs.getString(_profilePic) ?? '';
  }
}
