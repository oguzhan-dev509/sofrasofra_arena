import 'package:flutter/material.dart';

class PazarimSayfasi extends StatelessWidget {
  const PazarimSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
        title: const Text("ÖZEL DAVET PAZARI",
            style: TextStyle(
                color: Color(0xFFFFB300), fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _pazarKartCiz(
              "Düğün Organizasyonu", "150 Kişilik - İstanbul", "25.000 ₺"),
          _pazarKartCiz("Şirket Yemeği", "40 Kişilik - Ankara", "12.000 ₺"),
        ],
      ),
    );
  }

  Widget _pazarKartCiz(String b, String d, String f) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Sol Bölüm: Bilgiler
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(b,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
                const SizedBox(height: 4),
                Text(d,
                    style:
                        const TextStyle(color: Colors.white38, fontSize: 12)),
              ],
            ),
          ),
          // Sağ Bölüm: Fiyat
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFFFB300).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(f,
                style: const TextStyle(
                    color: Color(0xFFFFB300), fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
