import 'package:flutter/material.dart'; // BU SATIR HAYATİ ÖNEMDE!

class DashboardSayfasi extends StatelessWidget {
  const DashboardSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
        title: const Text("İŞLETME ÖZETİ",
            style: TextStyle(
                color: Color(0xFFFFB300), fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _ozetKartCiz("TOPLAM SATIŞ", "25.000 ₺", Icons.monetization_on),
          _ozetKartCiz("AKTİF SİPARİŞ", "4 Adet", Icons.shopping_basket),
          _ozetKartCiz("MÜŞTERİ PUANI", "4.9 / 5", Icons.star),
        ],
      ),
    );
  }

  Widget _ozetKartCiz(String b, String d, IconData i) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFFFB300).withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: const Color(0xFFFFB300).withOpacity(0.1),
                shape: BoxShape.circle),
            child: Icon(i, color: const Color(0xFFFFB300), size: 30),
          ),
          const SizedBox(width: 20),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(b,
                style: const TextStyle(
                    color: Colors.white38,
                    fontSize: 11,
                    fontWeight: FontWeight.bold)),
            Text(d,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900)),
          ]),
        ],
      ),
    );
  }
}
