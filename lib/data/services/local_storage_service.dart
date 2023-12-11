

import 'package:nb_utils/nb_utils.dart';

class LocalStorageService {
  SharedPreferences? _prefs;


  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

//  Singleton pattern for the service

static final LocalStorageService _instance = LocalStorageService._internal();

  factory LocalStorageService(){
    return _instance;
  }

  LocalStorageService._internal();

  // Save a String value in shared preferences
  Future<void> saveString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  // Get a String value from shared preferences
  String? getString(String key) {
    return _prefs?.getString(key);
  }

  // Clear a specific key from shared preferences
  Future<void> clearKey(String key) async {
    await _prefs?.remove(key);
  }

  // Clear all data from shared preferences
  Future<void> clearAll() async {
    await _prefs?.clear();
  }

}