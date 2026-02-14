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
          _buildEgitimKarti("EV YAPIMI ÇİKOLATA",
              "Artizan Teknikler & Temperleme", Icons.school),
          const SizedBox(height: 15),
          _buildEgitimKarti(
              "MANTI SANATI", "Geleneksel Katlama Yöntemleri", Icons.menu_book),
          const SizedBox(height: 15),
          _buildEgitimKarti(
              "ELİTE SUNUM", "Tabaklama ve Görsel Estetik", Icons.auto_awesome),
          const SizedBox(height: 15),
          _buildEgitimKarti(
              "YASAL MEVZUAT", "Hijyen ve Gıda Güvenliği", Icons.gavel),
        ],
      ),
    );
  }

  Widget _buildEgitimKarti(String baslik, String altBaslik, IconData ikon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20),
        border:
            Border.all(color: const Color(0xFFFFB300).withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Icon(ikon, color: const Color(0xFFFFB300), size: 40),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(baslik,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                Text(altBaslik,
                    style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 15),
        ],
      ),
    );
  }
}
