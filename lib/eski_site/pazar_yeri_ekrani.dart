import 'package:flutter/material.dart';
import 'detay_ekrani.dart';
import 'sepet_sayfasi.dart'; // EskiSepetSayfasi buranın içinde
import 'vitrin_merkezi.dart'; // VitrinMerkezi buranın içinde

class PazarYeriEkrani extends StatelessWidget {
  const PazarYeriEkrani({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("İMPARATORLUK PAZARI",
            style: TextStyle(
                color: Color(0xFFFFB300), fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_basket_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EskiSepetSayfasi()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const VitrinMerkezi(), // Onardığımız vitrini buraya bağladık
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1A1A1A)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DetayEkrani()),
                  );
                },
                child: const Text("ÜRÜN DETAYLARINI GÖR",
                    style: TextStyle(color: Color(0xFFFFB300))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
