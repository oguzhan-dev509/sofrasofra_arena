import 'package:flutter/material.dart';
import 'urun_detay_sayfasi.dart'; // Yeni oluşturduğumuz dosyayı buraya bağladık

class PazarYeriAnaSayfa extends StatefulWidget {
  const PazarYeriAnaSayfa({super.key});

  @override
  State<PazarYeriAnaSayfa> createState() => _PazarYeriAnaSayfaState();
}

class _PazarYeriAnaSayfaState extends State<PazarYeriAnaSayfa> {
  // 📚 YENİ NESİL "EV YAPIMI" KATEGORİLER
  final List<String> kategoriler = [
    "Ev Yemekleri",
    "Ev Yapımı Çikolata & Tatlı",
    "Ev Yapımı Süt Ürünleri",
    "Ev Yapımı Turşu & Reçel",
    "Ev Yapımı Baharat & Sos"
  ];

  String seciliKategori = "Ev Yemekleri";

  // 💎 "EV YAPIMI" MÜHÜRLÜ ÜRÜN LİSTESİ
  final List<Map<String, dynamic>> urunListesi = [
    {
      "ad": "Şef Elif'in Mantısı",
      "fiyat": "240 ₺",
      "kat": "Ev Yemekleri",
      "puan": "4.9",
      "ikon": Icons.restaurant
    },
    {
      "ad": "Artizan Bitter",
      "fiyat": "120 ₺",
      "kat": "Ev Yapımı Çikolata & Tatlı",
      "puan": "5.0",
      "ikon": Icons.bakery_dining
    },
    {
      "ad": "Köy Peyniri",
      "fiyat": "150 ₺",
      "kat": "Ev Yapımı Süt Ürünleri",
      "puan": "4.9",
      "ikon": Icons.egg
    },
    {
      "ad": "Çubuk Turşusu",
      "fiyat": "110 ₺",
      "kat": "Ev Yapımı Turşu & Reçel",
      "puan": "4.6",
      "ikon": Icons.waves
    },
    {
      "ad": "İpek Pul Biber",
      "fiyat": "145 ₺",
      "kat": "Ev Yapımı Baharat & Sos",
      "puan": "5.0",
      "ikon": Icons.local_fire_department
    },
  ];

  @override
  Widget build(BuildContext context) {
    final suzulenUrunler =
        urunListesi.where((u) => u['kat'] == seciliKategori).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
        title: const Text("SOFRASOFRA PAZAR",
            style: TextStyle(
                color: Color(0xFFFFB300), fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          _kategoriCubuguCiz(),
          const SizedBox(height: 20),
          Expanded(
            child: suzulenUrunler.isEmpty
                ? const Center(
                    child: Text("Bu kategoride ürün bulunamadı.",
                        style: TextStyle(color: Colors.grey)))
                : GridView.builder(
                    padding: const EdgeInsets.all(15),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 0.8),
                    itemCount: suzulenUrunler.length,
                    itemBuilder: (context, index) {
                      final urun = suzulenUrunler[index];
                      return _urunKartiCiz(urun);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _kategoriCubuguCiz() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kategoriler.length,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          bool seciliMi = seciliKategori == kategoriler[index];
          return GestureDetector(
            onTap: () => setState(() => seciliKategori = kategoriler[index]),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: seciliMi
                    ? const Color(0xFFFFB300)
                    : const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: const Color(0xFFFFB300).withValues(alpha: 0.3)),
              ),
              child: Center(
                child: Text(kategoriler[index],
                    style: TextStyle(
                        color: seciliMi ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _urunKartiCiz(Map<String, dynamic> urun) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UrunDetaySayfasi(urun: urun)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(20),
          border:
              Border.all(color: const Color(0xFFFFB300).withValues(alpha: 0.2)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(urun['ikon'], color: const Color(0xFFFFB300), size: 40),
            const SizedBox(height: 10),
            Text(urun['ad'],
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
                textAlign: TextAlign.center),
            const SizedBox(height: 5),
            Text(urun['fiyat'],
                style: const TextStyle(
                    color: Color(0xFFFFB300), fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 14),
                Text(urun['puan'],
                    style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
