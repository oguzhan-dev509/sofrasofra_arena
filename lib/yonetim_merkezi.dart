import 'package:flutter/material.dart';

class YonetimMerkeziSayfasi extends StatelessWidget {
  const YonetimMerkeziSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Arena'nın asil siyahı
      appBar: AppBar(
        title: const Text("YÖNETİM MERKEZİ",
            style: TextStyle(color: Color(0xFFFFB300), letterSpacing: 2)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // 📊 ÖZET ANALİZ PANELİ (HIZLI BİLGİ)
            _buildOzetPanel(),
            const SizedBox(height: 25),

            // 🛠️ YÖNETİM MODÜLLERİ
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                children: [
                  _buildYonetimKarti(
                      "Dükkan Onayları", Icons.storefront, Colors.blue),
                  _buildYonetimKarti("Yasal Evraklar", Icons.gavel, Colors.red),
                  _buildYonetimKarti(
                      "Finansal Analiz", Icons.monetization_on, Colors.green),
                  _buildYonetimKarti(
                      "Elite Üyeler", Icons.stars, Colors.purple),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ÖZET PANEL WIDGET'I
  Widget _buildOzetPanel() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFFFB300).withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem("Aktif Dükkan", "12"),
          _buildStatItem("Bekleyen Onay", "5"),
          _buildStatItem("Bugünkü Ciro", "₺24k"),
        ],
      ),
    );
  }

  // STATİSTİK ÖĞESİ
  static Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                color: Color(0xFFFFB300),
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        Text(label,
            style: const TextStyle(color: Colors.white70, fontSize: 10)),
      ],
    );
  }

  // YÖNETİM KARTI TASARIMI
  Widget _buildYonetimKarti(String baslik, IconData ikon, Color renk) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(ikon, color: renk, size: 40),
          const SizedBox(height: 10),
          Text(baslik,
              style: const TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }
}
