import 'package:flutter/material.dart';
import 'isletme_verisi.dart';

class UrunDetaySayfasi extends StatelessWidget {
  final Map<String, dynamic> urun;

  const UrunDetaySayfasi({super.key, required this.urun});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
        title:
            Text(urun['ad'], style: const TextStyle(color: Color(0xFFFFB300))),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          // 🖼️ ÜRÜN İKONU (BÜYÜK VE ŞIK)
          Center(
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                shape: BoxShape.circle,
                border: Border.all(
                    color: const Color(0xFFFFB300).withValues(alpha: 0.3)),
              ),
              child:
                  Icon(urun['ikon'], color: const Color(0xFFFFB300), size: 120),
            ),
          ),
          const SizedBox(height: 40),
          // 📝 ÜRÜN BİLGİLERİ
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(urun['ad'],
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold)),
                    Text(urun['fiyat'],
                        style: const TextStyle(
                            color: Color(0xFFFFB300),
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "ELİTE EV YAPIMI GARANTİSİ",
                  style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Bu ürün Anadolu'nun kalbinden, geleneksel yöntemlerle ve %100 doğal malzemelerle sizin için hazırlandı.",
                  style: TextStyle(
                      color: Colors.white70, fontSize: 16, height: 1.5),
                ),
              ],
            ),
          ),
          const Spacer(),
          // 🛒 SEPETE EKLE BUTONU
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: ElevatedButton(
              onPressed: () {
                // 1. Ürünü isletme_verisi içindeki listeye mühürle
                sepetim.add(urun);

                // 2. Kullanıcıya görsel bir zafer mesajı ver
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: const Color(0xFFFFB300),
                    duration:
                        const Duration(milliseconds: 800), // Hızlı ve akıcı
                    content: Text(
                      "${urun['ad']} Sepete Eklendi! (Toplam: ${sepetim.length})",
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFB300),
                minimumSize: const Size(double.infinity, 65),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text("SEPETE EKLE",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// 🛒 ARENA SEPET SİSTEMİ (HAFIZA ÜNİTESİ)
List<Map<String, dynamic>> sepetim = [];

// Sepetteki toplam ürün sayısını veren yardımcı fonksiyon
int get sepetAdeti => sepetim.length;
