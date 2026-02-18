import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'arena_motor.dart';
import 'sepet_sayfasi.dart';

class PazarYeriAnaSayfa extends StatelessWidget {
  const PazarYeriAnaSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: arenaSistemi,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            centerTitle: false,
            title: Text(arenaSistemi.dukkanAdi,
                style: const TextStyle(
                    color: Color(0xFFFFB300),
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                    fontSize: 16)),
            actions: [
              IconButton(
                icon: const Icon(Icons.camera_alt_outlined,
                    color: Color(0xFFFFB300), size: 26),
                onPressed: () => _masaustundenResimSec(context),
              ),
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined,
                    color: Color(0xFFFFB300), size: 26),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SepetSayfasi())),
              ),
              const SizedBox(width: 10),
            ],
          ),
          body: Column(
            children: [
              _buildKategoriListesi(),
              Expanded(
                child: GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio:
                          0.62, // New York Menü derinliği için oran ayarlandı
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 25),
                  itemCount: arenaSistemi.vitrinUrunleri.length,
                  itemBuilder: (context, index) =>
                      _buildUrunKarti(context, index),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildUrunKarti(BuildContext context, int index) {
    final urun = arenaSistemi.vitrinUrunleri[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🖼️ GÖRSEL ALANI (Lüks çerçeve ve Sharp Corner)
        Expanded(
          flex: 6,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      4), // Daha keskin ve modern bir duruş
                  border: Border.all(color: Colors.white.withOpacity(0.08)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: urun['data'] != null
                      ? Image.memory(urun['data'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity)
                      : Image.network(urun['resim'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity),
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: GestureDetector(
                  onTap: () => arenaSistemi.vitrindenSil(index),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        color: Colors.black54, shape: BoxShape.circle),
                    child:
                        const Icon(Icons.close, color: Colors.white, size: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
        // ✍️ NEW YORK RESTORAN TARİF ALANI (Minimalist & Aristokrat)
        const SizedBox(height: 12),
        Text(
          urun['isim'].toString().toUpperCase(),
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 12,
              letterSpacing: 1.2),
        ),
        const SizedBox(height: 6),
        Text(
          urun['tarif'] ?? "Şefin özel dokunuşuyla hazırlanan eşsiz lezzet.",
          maxLines: 3,
          style: TextStyle(
              color: Colors.white.withOpacity(0.4),
              fontSize: 10,
              height: 1.5,
              fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(urun['fiyat'],
                style: const TextStyle(
                    color: Color(0xFFFFB300),
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
            GestureDetector(
              onTap: () => arenaSistemi.sepeteEkle(urun),
              child: const Icon(Icons.add, color: Color(0xFFFFB300), size: 22),
            ),
          ],
        ),
      ],
    );
  }

  // 📸 MASAÜSTÜNDEN RESİM VE TARİF MÜHÜRLEME
  Future<void> _masaustundenResimSec(BuildContext context) async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.single.bytes != null) {
      final bytes = result.files.single.bytes;
      TextEditingController isimKontrol = TextEditingController();
      TextEditingController tarifKontrol = TextEditingController();

      if (!context.mounted) return;
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: const Color(0xFF111111),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          title: const Text("NEW YORK GASTRONOMY INPUT",
              style: TextStyle(
                  color: Color(0xFFFFB300),
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: isimKontrol,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: "LEZZET ADI",
                      hintStyle: TextStyle(color: Colors.white24))),
              const SizedBox(height: 15),
              TextField(
                  controller: tarifKontrol,
                  maxLines: 3,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: "ŞEFİN NOTU / TARİF",
                      hintStyle: TextStyle(color: Colors.white24))),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("İPTAL",
                    style: TextStyle(color: Colors.white38))),
            TextButton(
              onPressed: () {
                arenaSistemi.vitrineEkle(isimKontrol.text, "450 ₺",
                    "https://via.placeholder.com/500",
                    data: bytes, tarif: tarifKontrol.text);
                Navigator.pop(context);
              },
              child: const Text("MÜHÜRLE",
                  style: TextStyle(color: Color(0xFFFFB300))),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildKategoriListesi() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: arenaSistemi.kategoriler.length,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemBuilder: (context, index) {
          final kat = arenaSistemi.kategoriler[index];
          bool isSelected = arenaSistemi.secilenKategori == kat;
          return GestureDetector(
            onTap: () => arenaSistemi.kategoriDegistir(kat),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                border: Border.all(
                    color:
                        isSelected ? const Color(0xFFFFB300) : Colors.white10),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Center(
                  child: Text(kat,
                      style: TextStyle(
                          color: isSelected
                              ? const Color(0xFFFFB300)
                              : Colors.white38,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1))),
            ),
          );
        },
      ),
    );
  }
}
