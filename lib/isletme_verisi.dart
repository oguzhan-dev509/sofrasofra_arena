class IsletmeVerisi {
  final String dukkanAdi;
  final double toplamSatis;
  final int aktifSiparis;
  final double musteriPuani;

  IsletmeVerisi({
    required this.dukkanAdi,
    required this.toplamSatis,
    required this.aktifSiparis,
    required this.musteriPuani,
  });
}

// 📊 ŞİMDİLİK TEST VERİSİ (YARIN BURASI FIREBASE'DEN GELECEK)
final benimDukkanim = IsletmeVerisi(
  dukkanAdi: "Anadolu Sofrası Elite",
  toplamSatis: 25850.50,
  aktifSiparis: 4,
  musteriPuani: 4.9,
);
