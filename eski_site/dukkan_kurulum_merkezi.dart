import 'package:flutter/material.dart';
import 'dukkan_kurma_sayfasi.dart'; // Köprüyü kurduk
import 'arena_kontrol.dart'; // Hafıza birliği için

class DukkanKurulumMerkezi extends StatelessWidget {
  const DukkanKurulumMerkezi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("KURULUM MERKEZİ",
            style: TextStyle(
                color: Color(0xFFFFB300),
                fontWeight: FontWeight.w900,
                letterSpacing: 2)),
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.storefront_outlined,
                  size: 80, color: Color(0xFFFFB300)),
              const SizedBox(height: 20),
              const Text(
                "DÜKKANINI YÖNETMEYE HAZIR MISIN?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),

              // 🚀 DÜKKAN KURMA SAYFASINA GİDEN BUTON
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A1A1A),
                  side: const BorderSide(color: Color(0xFFFFB300), width: 2),
                  minimumSize: const Size(double.infinity, 65),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DukkanKurmaSayfasi()),
                  );
                },
                child: const Text("DÜKKAN AYARLARINA GİT",
                    style: TextStyle(
                        color: Color(0xFFFFB300), fontWeight: FontWeight.bold)),
              ),

              const SizedBox(height: 20),

              // 🏠 ARENA'YA DÖNÜŞ BUTONU
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("ANA SAYFAYA DÖN",
                    style: TextStyle(color: Colors.white54)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
