import 'package:flutter/material.dart';
import 'menu_yoneticisi.dart'; // Aynı klasördeki rehber

class EskiAnaGirisSayfasi extends StatefulWidget {
  const EskiAnaGirisSayfasi({super.key});

  @override
  State<EskiAnaGirisSayfasi> createState() => _EskiAnaGirisSayfasiState();
}

class _EskiAnaGirisSayfasiState extends State<EskiAnaGirisSayfasi> {
  // Şehir listesini ve seçilen şehri koruyoruz
  final List<String> sehirListesi = [
    "Adana",
    "Ankara",
    "Antalya",
    "Aydın",
    "Balıkesir",
    "Bursa",
    "İstanbul",
    "İzmir"
  ];
  String secilenSehir = "İstanbul";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text("İMPARATORLUK GİRİŞİ",
            style: TextStyle(
                color: Color(0xFFFFB300),
                fontWeight: FontWeight.bold,
                fontSize: 14)),
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on_outlined,
                  color: Color(0xFFFFB300), size: 60),
              const SizedBox(height: 20),
              const Text("Lütfen Şehir Seçiniz",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              const SizedBox(height: 30),

              // Şehir Seçme Kutusu
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFFFB300)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButton<String>(
                  dropdownColor: Colors.black,
                  value: secilenSehir,
                  isExpanded: true,
                  underline: const SizedBox(),
                  style: const TextStyle(color: Colors.white),
                  items: sehirListesi
                      .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                      .toList(),
                  onChanged: (v) => setState(() => secilenSehir = v!),
                ),
              ),

              const SizedBox(height: 50),

              // 🚀 ARENA'YA GİRİŞ BUTONU
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFB300),
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MenuYoneticisi()),
                  );
                },
                child: const Text("SİSTEME GİRİŞ YAP",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
