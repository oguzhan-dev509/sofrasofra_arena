import 'package:shared_preferences/shared_preferences.dart';

class DukkanVerisi {
  static const String _key = 'dukkan_adi';

  // 1️⃣ Dükkan ismini kalıcı olarak hafızaya mühürler
  static Future<void> ismiKaydet(String isim) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, isim);
  }

  // 2️⃣ Mühürlü ismi hafızadan geri çağırır
  static Future<String?> ismiGetir() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }

  // 3️⃣ Gerekirse hafızayı temizler
  static Future<void> hafizayiTemizle() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
