import 'package:flutter/material.dart';
import 'sepet_verisi.dart';

class OdemeSayfasi extends StatelessWidget {
  const OdemeSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("ADRES VE ÖDEME",
            style: TextStyle(
                color: Color(0xFFFFB300), fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _bolumBasligi("Teslimat Adresi"),
            const SizedBox(height: 15),
            _adresGirisAlani("Ad Soyad", Icons.person_outline),
            _adresGirisAlani("Telefon Numarası", Icons.phone_android),
            _adresGirisAlani(
                "Mahalle / Sokak / No", Icons.location_on_outlined),
            const SizedBox(height: 30),
            _bolumBasligi("Sipariş Özeti"),
            const SizedBox(height: 15),
            _siparisOzetiKutusu(),
            const SizedBox(height: 40),
            _onayButonu(context),
          ],
        ),
      ),
    );
  }

  Widget _bolumBasligi(String baslik) {
    return Text(baslik,
        style: const TextStyle(
            color: Color(0xFFFFB300),
            fontSize: 18,
            fontWeight: FontWeight.bold));
  }

  Widget _adresGirisAlani(String ipucu, IconData ikon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(15)),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(ikon, color: const Color(0xFFFFB300)),
          hintText: ipucu,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15),
        ),
      ),
    );
  }

  Widget _siparisOzetiKutusu() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Ürün Sayısı:", style: TextStyle(color: Colors.grey)),
              Text("${SepetVerisi.sepettekiUrunler.length} Adet",
                  style: const TextStyle(color: Colors.white)),
            ],
          ),
          const Divider(color: Colors.white10, height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Ödenecek Tutar:",
                  style: TextStyle(color: Colors.grey, fontSize: 18)),
              Text("${SepetVerisi.toplamTutar.toStringAsFixed(0)} ₺",
                  style: const TextStyle(
                      color: Color(0xFFFFB300),
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _onayButonu(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Siparişiniz Arena'ya iletildi!")));
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFB300),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: const Text("SİPARİŞİ TAMAMLA",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
      ),
    );
  }
}
