import 'package:flutter/material.dart';
import 'detay_ekrani.dart';

class DetayEkrani extends StatelessWidget {
  final String isim;
  final String fiyat;

  // ✨ Constructor (Yapıcı)
  const DetayEkrani({super.key, required this.isim, required this.fiyat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
        title: Text(isim, style: const TextStyle(color: Color(0xFFFFB300))),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.restaurant, color: Color(0xFFFFB300), size: 120),
            const SizedBox(height: 20),
            Text(isim,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(fiyat,
                style: const TextStyle(
                    color: Color(0xFFFFB300),
                    fontSize: 32,
                    fontWeight: FontWeight.w900)),
          ],
        ),
      ),
    );
  }
}
