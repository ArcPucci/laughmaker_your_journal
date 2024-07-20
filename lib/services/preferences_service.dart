import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final SharedPreferences _preferences;

  PreferencesService({
    required SharedPreferences preferences,
  }) : _preferences = preferences;

  static const premiumKey = "PREMIUM";
  static const hintKey = "HINT";

  Future<void> setPremium() async {
    await _preferences.setBool(premiumKey, true);
  }

  bool getPremium() {
    return _preferences.getBool(premiumKey) ?? false;
  }

  Future<void> setHint() async {
    await _preferences.setBool(hintKey, true);
  }

  bool getHint() {
    return _preferences.getBool(hintKey) ?? false;
  }
}
