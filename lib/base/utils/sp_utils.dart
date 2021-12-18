import 'package:shared_preferences/shared_preferences.dart';

/// 缓存管理类
class SPUtils {
  SharedPreferences? prefs;

  static SPUtils? _instance;

  SPUtils._() {
    init();
  }

  SPUtils._pre(SharedPreferences prefs) {
    this.prefs = prefs;
  }

  /// 预初始化，防止在使用 get 时，prefs还未完成初始化
  static Future<SPUtils> preInit() async {
    if (_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      _instance = SPUtils._pre(prefs);
    }
    return _instance!;
  }

  static SPUtils getInstance() {
    if (_instance == null) {
      _instance = SPUtils._();
    }
    return _instance!;
  }

  void init() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
  }

  setString(String key, String value) {
    prefs?.setString(key, value);
  }

  setDouble(String key, double value) {
    prefs?.setDouble(key, value);
  }

  setInt(String key, int value) {
    prefs?.setInt(key, value);
  }

  setBool(String key, bool value) {
    prefs?.setBool(key, value);
  }

  setStringList(String key, List<String> value) {
    prefs?.setStringList(key, value);
  }

  remove(String key) {
    prefs?.remove(key);
  }

  T? get<T>(String key) {
    var result = prefs?.get(key);
    if (result != null) {
      return result as T;
    }
    return null;
  }
}
