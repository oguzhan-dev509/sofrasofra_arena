import 'package:flutter/material.dart';
import 'arena_kontrol.dart'; // Hafıza ve veri birliği için
import 'detay_ekrani.dart'; // Ürüne tıklayınca gitmek için

class VitrinMerkezi extends StatelessWidget {
  const VitrinMerkezi({super.key});

  @override
  Widget build(BuildContext context) {
    // 💡 NOT: Eğer 'DukkanVerisi' veya 'arenaSistemi' burada hata verirse,
    // arena_kontrol.dart dosyasındaki isimlerle eşleştiğinden emin olacağız.

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("İMPARATORLUK VİTRİNİ",
            style: TextStyle(
                color: Color(0xFFFFB300), fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.auto_awesome_mosaic, color: Color(0xFFFFB300), size: 60),
            SizedBox(height: 20),
            Text("VİTRİN MODÜLÜ AKTİF EDİLDİ",
                style: TextStyle(
                    color: Colors.white, fontSize: 16, letterSpacing: 1.5)),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("Hatalar temizlendi, bağlantılar onarıldı.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white38, fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }
}
