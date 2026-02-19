import 'package:flutter/material.dart';

class DukkanKurSayfasi extends StatefulWidget {
  const DukkanKurSayfasi({super.key});

  @override
  State<DukkanKurSayfasi> createState() => _DukkanKurSayfasiState();
}

class _DukkanKurSayfasiState extends State<DukkanKurSayfasi> {
  final TextEditingController _adController = TextEditingController();
  final TextEditingController _dukkanController = TextEditingController();
  final TextEditingController _uzmanlikController = TextEditingController();

  @override
  void dispose() {
    _adController.dispose();
    _dukkanController.dispose();
    _uzmanlikController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
        title: const Text("DÜKKANIMI KUR",
            style: TextStyle(
                color: Color(0xFFFFB300), fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.add_business, color: Color(0xFFFFB300), size: 60),
            const SizedBox(height: 20),
            const Text(
              "ARENA'YA HOŞ GELDİN ŞEF!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Dükkanını kurmak ve Elite ağımıza katılmak için bilgileri doldur.",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 40),
            _buildGirisAlani("Adınız Soyadınız", Icons.person, _adController),
            const SizedBox(height: 20),
            _buildGirisAlani(
                "Dükkanınızın Adı", Icons.store, _dukkanController),
            const SizedBox(height: 20),
            _buildGirisAlani("Uzmanlık Alanınız (Örn: Mantı, Turşu)",
                Icons.restaurant_menu, _uzmanlikController),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => _kaydiTamamla(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFB300),
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              child: const Text("DÜKKANIMI AÇ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGirisAlani(
      String etiket, IconData ikon, TextEditingController controller) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: etiket,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(ikon, color: const Color(0xFFFFB300)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:
              BorderSide(color: const Color(0xFFFFB300).withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFFFB300)),
        ),
        filled: true,
        fillColor: const Color(0xFF1A1A1A),
      ),
    );
  }

  void _kaydiTamamla(BuildContext context) {
    if (_adController.text.isEmpty || _dukkanController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Lütfen tüm alanları doldurun!")),
      );
      return;
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A1A),
        title:
            const Text("BAŞARILI!", style: TextStyle(color: Color(0xFFFFB300))),
        content: Text(
            "${_dukkanController.text} dükkanın başarıyla oluşturuldu. Arena'ya hoş geldin, ${_adController.text}!",
            style: const TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child:
                const Text("TAMAM", style: TextStyle(color: Color(0xFFFFB300))),
          ),
        ],
      ),
    );
  }
}
