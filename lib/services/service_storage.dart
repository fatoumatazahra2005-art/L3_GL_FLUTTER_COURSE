import 'package:shared_preferences/shared_preferences.dart';

class ServiceStorage {
  static ServiceStorage?  _instance ;

  static ServiceStorage get instance{
     _instance ??=ServiceStorage._();
     return _instance! ;
  }

  ServiceStorage._();

  late SharedPreferences _prefs;

  bool _initialized = false ;

  Future<void> init() async{
    if(_initialized) return ;
    _prefs = await SharedPreferences.getInstance();
    _initialized = true;
  }

  static const String _keyOnboardingComplete = 'onboarding_complete';

  bool get isOnboardingComplete{
    return _prefs.getBool(_keyOnboardingComplete) ?? false ;
  }
}