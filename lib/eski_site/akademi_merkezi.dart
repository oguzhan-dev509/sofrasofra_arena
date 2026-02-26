import 'package:flutter/material.dart';

class AkademiSayfasi extends StatelessWidget {
  const AkademiSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
        title: const Text("AKADEMİ MERKEZİ",
            style: TextStyle(
                color: Color(0xFFFFB300), fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildEgitimKarti("MANTI SANATI",
              "Geleneksel Katlama ve Hamur Teknikleri", Icons.restaurant),
          _buildEgitimKarti("ELITE SUNUM", "Tabaklama Sanatı ve Görsel Estetik",
              Icons.auto_awesome),
          _buildEgitimKarti("YASAL MEVZUAT",
              "Ev Tipi Üretimde Hijyen Standartları", Icons.gavel),
          _buildEgitimKarti(
              "SÜRDÜRÜLEBİLİR MUTFAK", "Sıfır Atık ve Verimlilik", Icons.eco),
          _buildEgitimKarti("AI DESTEKLİ GASTRONOMİ",
              "Modern Teknolojilerle Menü Planlama", Icons.psychology),
        ],
      ),
    );
  }

  Widget _buildEgitimKarti(String baslik, String altBaslik, IconData ikon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFFFB300).withOpacity(0.2)),
      ),
      child: ListTile(
        leading: Icon(ikon, color: const Color(0xFFFFB300), size: 30),
        title: Text(baslik,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Text(altBaslik,
            style: const TextStyle(color: Colors.grey, fontSize: 11)),
        trailing: const Icon(Icons.play_circle_fill, color: Color(0xFFFFB300)),
      ),
    );
  }
}
