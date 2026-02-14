import 'package:flutter/material.dart';
import 'pazarim_sayfasi.dart';
import 'dashboard_sayfasi.dart';
import 'akademi_sayfasi.dart';
import 'dukkan_kur_sayfasi.dart';

class MenuYoneticisi extends StatelessWidget {
  const MenuYoneticisi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Başlıkları sola hizalar
          children: [
            // 🖼️ 1. ÜST VİTRİN GÖRSELİ
            Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/anadolu_vitrin.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // ⭐ 2. HAFTANIN ŞEFLERİ BAŞLIĞI
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 25, bottom: 10),
              child: Text(
                "HAFTANIN ŞEFLERİ",
                style: TextStyle(
                    color: Color(0xFFFFB300),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
            ),

            // 🎡 3. KAYDIRILABİLİR ŞEF VİTRİNİ
            SizedBox(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                children: [
                  _buildSefKarti(
                      "Şef Elif", Icons.face_retouching_natural, "4.9"),
                  _buildSefKarti("Şef Osman", Icons.face, "5.0"),
                  _buildSefKarti("Şef Maria", Icons.face_3, "4.8"),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // 🎴 4. ANA MODÜLLER (TEK VE NET GRID)
            Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.count(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // İç içe kaydırmayı engeller
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _buildModulButonu(context, "VİTRİNİM", "Pazar Yerine Git",
                      Icons.storefront, const PazarYeriAnaSayfa()),
                  _buildModulButonu(context, "KURUMSAL", "Yasal Yönetim",
                      Icons.gavel, const DashboardSayfasi()),
                  _buildModulButonu(context, "AKADEMİM", "Eğitim Merkezi",
                      Icons.school, const AkademiSayfasi()),
                  _buildModulButonu(context, "DÜKKANIMI KUR", "İşletme Kaydı",
                      Icons.add_business, const DukkanKurSayfasi()),
                ],
              ),
            ),

            // 🏁 KOD BURADA BİTİYOR - ALTTA BAŞKA HİÇBİR ŞEY YOK!
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // 👨‍🍳 ŞEF KARTI ÇİZİCİ FONKSİYONU
  Widget _buildSefKarti(String isim, IconData ikon, String puan) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20),
        border:
            Border.all(color: const Color(0xFFFFB300).withValues(alpha: 0.2)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(ikon, color: const Color(0xFFFFB300), size: 40),
          const SizedBox(height: 8),
          Text(isim,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 12),
              Text(puan,
                  style: const TextStyle(color: Colors.grey, fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }

  // 🛠️ ANA MODÜL BUTONU ÇİZİCİ FONKSİYONU
  Widget _buildModulButonu(BuildContext context, String baslik,
      String altBaslik, IconData ikon, Widget? sayfa) {
    return InkWell(
      onTap: () {
        if (sayfa != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => sayfa));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(15),
          border:
              Border.all(color: const Color(0xFFFFB300).withValues(alpha: 0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(ikon, color: const Color(0xFFFFB300), size: 35),
            const SizedBox(height: 8),
            Text(baslik,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13)),
            Text(altBaslik,
                style: const TextStyle(color: Colors.grey, fontSize: 9)),
          ],
        ),
      ),
    );
  }
}
