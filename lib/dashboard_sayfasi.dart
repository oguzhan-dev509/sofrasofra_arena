import 'package:flutter/material.dart';
import 'isletme_verisi.dart'; // Canlı veri merkezini bağladık

class DashboardSayfasi extends StatelessWidget {
  const DashboardSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
        title: const Text("İŞLETME ÖZETİ",
            style: TextStyle(
                color: Color(0xFFFFB300), fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            // 💰 TOPLAM SATIŞ KARTI (CANLI)
            _ozetKartCiz(
                "TOPLAM SATIŞ",
                "₺${benimDukkanim.toplamSatis.toStringAsFixed(0)}",
                Icons.monetization_on),
            const SizedBox(height: 15),
            // 📦 AKTİF SİPARİŞ KARTI (CANLI)
            _ozetKartCiz("AKTİF SİPARİŞ", "${benimDukkanim.aktifSiparis} Adet",
                Icons.shopping_basket),
            const SizedBox(height: 15),
            // ⭐ MÜŞTERİ PUANI KARTI (CANLI)
            _ozetKartCiz("MÜŞTERİ PUANI", "${benimDukkanim.musteriPuani} / 5",
                Icons.star),
          ],
        ),
      ),
    );
  }

  // 🛠️ YARDIMCI KART ÇİZİCİ (3 DEĞİŞKENLİ)
  Widget _ozetKartCiz(String baslik, String deger, IconData ikon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(24),
        border:
            Border.all(color: const Color(0xFFFFB300).withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(ikon, color: const Color(0xFFFFB300), size: 35),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(baslik,
                  style: const TextStyle(color: Colors.grey, fontSize: 12)),
              Text(deger,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
