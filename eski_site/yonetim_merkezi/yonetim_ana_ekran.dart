import 'package:flutter/material.dart';

class YonetimAnaEkran extends StatelessWidget {
  const YonetimAnaEkran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("ARENA KOMUTA MERKEZİ",
            style: TextStyle(
                color: Color(0xFFFFB300),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 📊 CANLI VERİ PANELİ
            _ozetKarti(),
            const SizedBox(height: 30),
            // 🛠️ YÖNETİM MODÜL LİSTESİ
            _yonetimGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _ozetKarti() {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.grey[900]!, Colors.black]),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFFFB300).withOpacity(0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _statItem("12", "DÜKKAN"),
          _statItem("5", "ONAY BEKLEYEN"),
          _statItem("₺24K", "GÜNLÜK HAKEDİŞ"),
        ],
      ),
    );
  }

  Widget _yonetimGrid(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      children: [
        _modulKarti(
            "DÜKKANLARI YÖNET", Icons.store_mall_directory, Colors.blue),
        _modulKarti("YASAL BELGELER", Icons.verified_user, Colors.green),
        _modulKarti("GELİR RAPORLARI", Icons.analytics, Colors.orange),
        _modulKarti("SİSTEM AYARLARI", Icons.settings, Colors.red),
      ],
    );
  }

  // Tasarım Yardımcıları
  static Widget _statItem(String val, String label) {
    return Column(children: [
      Text(val,
          style: const TextStyle(
              color: Color(0xFFFFB300),
              fontSize: 24,
              fontWeight: FontWeight.bold)),
      Text(label, style: const TextStyle(color: Colors.white60, fontSize: 10)),
    ]);
  }

  Widget _modulKarti(String ad, IconData ikon, Color renk) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[900], borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(ikon, color: renk, size: 35),
          const SizedBox(height: 12),
          Text(ad,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}
