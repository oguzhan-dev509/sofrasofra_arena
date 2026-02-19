import 'package:flutter/material.dart';
import 'pazar_yeri_ekrani.dart';
import 'dashboard_sayfasi.dart';
import 'akademi_merkezi.dart';
import 'dukkan_kur_sayfasi.dart';

class MenuYoneticisi extends StatelessWidget {
  const MenuYoneticisi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🖼️ ÜST VİTRİN
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

            const SizedBox(height: 20),

            // 🎴 ANA MODÜLLER
            Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _buildModul(context, "VİTRİNİM", Icons.storefront,
                      const PazarYeriAnaSayfa()),
                  _buildModul(context, "KURUMSAL", Icons.gavel,
                      const DashboardSayfasi()),
                  _buildModul(context, "AKADEMİM", Icons.school,
                      const AkademiSayfasi()),
                  _buildModul(context, "DÜKKANIMI KUR", Icons.add_business,
                      const DukkanKurSayfasi()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModul(
      BuildContext context, String baslik, IconData ikon, Widget sayfa) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => sayfa)),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFFFFB300).withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(ikon, color: const Color(0xFFFFB300), size: 40),
            const SizedBox(height: 10),
            Text(baslik,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
