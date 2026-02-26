import 'package:flutter/material.dart';
import 'arena_kontrol.dart'; // Hafıza mühürü için gerekli

class DukkanKurmaSayfasi extends StatefulWidget {
  const DukkanKurmaSayfasi({super.key});

  @override
  State<DukkanKurmaSayfasi> createState() => _DukkanKurmaSayfasiState();
}

class _DukkanKurmaSayfasiState extends State<DukkanKurmaSayfasi> {
  // 1️⃣ Dükkan adı için kontrolcü (Controller)
  final TextEditingController dukkanAdiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Arena estetiği
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("DÜKKANINI MÜHÜRLE",
            style: TextStyle(
                color: Color(0xFFFFB300), fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: dukkanAdiController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "DÜKKAN ADI",
                labelStyle: const TextStyle(color: Color(0xFFFFB300)),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFFFB300)),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // 🚀 İŞTE O KRİTİK BUTON
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFB300),
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () async {
                String girilenIsim = dukkanAdiController.text.toUpperCase();

                if (girilenIsim.isNotEmpty) {
                  // 1️⃣ Hafızaya mühürle
                  await DukkanVerisi.ismiKaydet(girilenIsim);

                  // 2️⃣ Başarı mesajını göster
                  if (context.mounted) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: const Color(0xFF1E1E1E),
                        title: const Text("BAŞARILI!",
                            style: TextStyle(color: Color(0xFFFFB300))),
                        content: Text(
                            "$girilenIsim dükkanın başarıyla mühürlendi.",
                            style: const TextStyle(color: Colors.white)),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Diyaloğu kapat
                              Navigator.pop(context); // Arena'ya dön
                            },
                            child: const Text("TAMAM",
                                style: TextStyle(color: Color(0xFFFFB300))),
                          ),
                        ],
                      ),
                    );
                  }
                }
              },
              child: const Text("DÜKKANI KUR",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
