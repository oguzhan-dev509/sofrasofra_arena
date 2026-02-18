import 'package:flutter/material.dart';
import 'dart:typed_data';

class ArenaMotoru extends ChangeNotifier {
  String dukkanAdi = "SOFRASOFRA ARENA";
  final List<String> kategoriler = [
    "EV YEMEKLERİ",
    "ÇİKOLATA & TATLI",
    "SÜT ÜRÜNLERİ",
    "TURŞU & REÇEL",
    "BAHARAT & SOS",
    "ZEYTİNYAĞLILAR",
    "HAMUR İŞLERİ"
  ];
  String secilenKategori = "EV YEMEKLERİ";
  List<Map<String, dynamic>> sepet = [
    {"isim": "Arena Hoş Geldin İkramı", "fiyat": "0 ₺"}
  ];

  // 🏛️ VİTRİN (Artık tarif alanı da var!)
  List<Map<String, dynamic>> vitrinUrunleri = [
    {
      "isim": "Özel Gurme Spesiyal",
      "fiyat": "250 ₺",
      "resim": "https://images.unsplash.com/photo-1547592166-23ac45744acd",
      "tarif":
          "Geleneksel yöntemlerle, taze baharatlar ve odun ateşinde pişirilen eşsiz bir Anadolu lezzeti.",
      "data": null
    },
  ];

  // ✨ TARİFLİ EKLEME MÜHÜRÜ
  void vitrineEkle(String isim, String fiyat, String resimUrl,
      {Uint8List? data, String? tarif}) {
    vitrinUrunleri.add({
      "isim": isim,
      "fiyat": fiyat,
      "resim": resimUrl,
      "data": data,
      "tarif": tarif ?? "Tarif henüz eklenmedi."
    });
    notifyListeners();
  }

  // (Diğer silme, kategori ve sepet fonksiyonları değişmiyor)
  void vitrindenSil(int index) {
    if (index >= 0 && index < vitrinUrunleri.length) {
      vitrinUrunleri.removeAt(index);
      notifyListeners();
    }
  }

  void kategoriDegistir(String yeni) {
    secilenKategori = yeni;
    notifyListeners();
  }

  void sepeteEkle(Map<String, dynamic> urun) {
    sepet.add(urun);
    notifyListeners();
  }

  void sepettenCikar(int index) {
    if (index >= 0 && index < sepet.length) {
      sepet.removeAt(index);
      notifyListeners();
    }
  }

  double get toplamFiyat {
    double toplam = 0;
    for (var urun in sepet) {
      String fiyatMetni =
          urun['fiyat'].toString().replaceAll(RegExp(r'[^0-9]'), '');
      toplam += double.tryParse(fiyatMetni) ?? 0;
    }
    return toplam;
  }
}

final arenaSistemi = ArenaMotoru();
