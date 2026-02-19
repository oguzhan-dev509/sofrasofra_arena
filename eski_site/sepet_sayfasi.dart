import 'package:flutter/material.dart';
import 'arena_kontrol.dart'; // Veri birliği için

class EskiSepetSayfasi extends StatelessWidget {
  const EskiSepetSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("ESKİ SEPETİM",
            style: TextStyle(
                color: Color(0xFFFFB300),
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_cart_outlined,
                color: Color(0xFFFFB300), size: 70),
            const SizedBox(height: 20),
            const Text(
              "SEPET ŞİMDİLİK BOŞ",
              style: TextStyle(
                  color: Colors.white, fontSize: 18, letterSpacing: 2),
            ),
            const SizedBox(height: 10),
            const Text(
              "Eski sistem kayıtları onarıldı.",
              style: TextStyle(color: Colors.white38, fontSize: 12),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFB300),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () => Navigator.pop(context),
              child:
                  const Text("GERİ DÖN", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
