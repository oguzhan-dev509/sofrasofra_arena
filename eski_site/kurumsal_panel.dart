import 'package:flutter/material.dart';

class KurumsalPanelSayfasi extends StatefulWidget {
  const KurumsalPanelSayfasi({super.key});
  @override
  State<KurumsalPanelSayfasi> createState() => _KurumsalPanelSayfasiState();
}

class _KurumsalPanelSayfasiState extends State<KurumsalPanelSayfasi> {
  // Veri girişleri için kontrolcüler
  final TextEditingController _bankaController = TextEditingController();
  final TextEditingController _ibanController = TextEditingController();
  final TextEditingController _vergiNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "KURUMSAL YÖNETİM",
          style: TextStyle(color: Color(0xFFFFB300)),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _bolumBasligi("1. FİNANSAL KİMLİK"),
            _inputAlani("Banka Adı", _bankaController, Icons.account_balance),
            _inputAlani("IBAN Numarası", _ibanController, Icons.credit_card),

            const SizedBox(height: 30),

            _bolumBasligi("2. İŞLETME BİLGİLERİ"),
            _inputAlani(
              "Vergi No / TC No",
              _vergiNoController,
              Icons.admin_panel_settings,
            ),

            const SizedBox(height: 40),

            // Kaydet Butonu
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFB300),
                ),
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Bilgiler Kaydedildi!")),
                ),
                child: const Text(
                  "GÜNCELLE VE MÜHÜRLE",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),

            const SizedBox(height: 50),
            _bilgiLinkleri(context),
          ],
        ),
      ),
    );
  }

  Widget _bolumBasligi(String baslik) {
    return Text(
      baslik,
      style: const TextStyle(
        color: Color(0xFFFFB300),
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _inputAlani(
    String etiket,
    TextEditingController controller,
    IconData ikon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(ikon, color: const Color(0xFFFFB300)),
          labelText: etiket,
          labelStyle: const TextStyle(color: Colors.white60),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white24),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFB300)),
          ),
        ),
      ),
    );
  }

  Widget _bilgiLinkleri(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _altLink(
          context,
          "Hakkımızda",
          "HAKKIMIZDA",
          "Sofrasofra dijital imzadır.",
        ),
        _altLink(context, "KVKK", "AYDINLATMA", "Verileriniz güvende."),
        _altLink(context, "İletişim", "İLETİŞİM", "destek@sofrasofra.com"),
      ],
    );
  }

  Widget _altLink(
    BuildContext context,
    String butonIsmi,
    String sayfaBasligi,
    String sayfaIcerigi,
  ) {
    return TextButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              BilgiMerkeziSayfasi(baslik: sayfaBasligi, icerik: sayfaIcerigi),
        ),
      ),
      child: Text(
        butonIsmi,
        style: const TextStyle(color: Colors.white38, fontSize: 12),
      ),
    );
  }
}
