import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data'; // ✨ Fotoğraf verisi için gerekli
import 'sepet_sayfasi.dart';
import 'sepet_verisi.dart';

class PazarYeriAnaSayfa extends StatefulWidget {
  const PazarYeriAnaSayfa({super.key});

  @override
  State<PazarYeriAnaSayfa> createState() => _PazarYeriAnaSayfaState();
}

class _PazarYeriAnaSayfaState extends State<PazarYeriAnaSayfa> {
  // ✨ ÜRÜN MODELİ: Hem internet linki hem de seçilen dosya verisi (bytes) tutar
  List<Map<String, dynamic>> vitrinUrunleri = List.generate(
      18,
      (index) => {
            'id': index.toString(),
            'isim': 'Ürün ${index + 1}',
            'fiyat': '${(index + 1) * 50} ₺',
            'resim':
                'https://images.unsplash.com/photo-1590779033100-9f60a05a013d?q=80&w=200',
            'dosyaVerisi': null // Başlangıçta boş
          });

  // 📂 MASAÜSTÜNDEN GERÇEK FOTOĞRAF SEÇME
  Future<void> _fotoSecVeEkle() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null && result.files.first.bytes != null) {
      Uint8List fileBytes = result.files.first.bytes!;
      String fileName = result.files.first.name;

      setState(() {
        vitrinUrunleri.insert(0, {
          'id': DateTime.now().toString(),
          'isim': fileName, // Dosya ismini ürün ismi yapalım
          'fiyat': '250 ₺',
          'resim': '',
          'dosyaVerisi':
              fileBytes, // ✨ Seçilen gerçek fotoğraf verisi buraya mühürlendi!
        });
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Seçtiğiniz fotoğraf vitrine mühürlendi!"),
          backgroundColor: Colors.green));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
        title: const Text("SOFRASOFRA ARENA",
            style: TextStyle(
                color: Color(0xFFFFB300), fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              icon: const Icon(Icons.add_a_photo_outlined,
                  color: Color(0xFFFFB300)),
              onPressed: _fotoSecVeEkle),
          IconButton(
              icon: const Icon(Icons.shopping_cart_outlined),
              onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SepetSayfasi()))
                  .then((_) => setState(() {}))),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: vitrinUrunleri.isEmpty
              ? const Center(
                  child: Text("Vitrin boş kaptan!",
                      style: TextStyle(color: Colors.grey)))
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.6),
                  itemCount: vitrinUrunleri.length,
                  itemBuilder: (context, index) => _urunKarti(index),
                ),
        ),
      ),
    );
  }

  Widget _urunKarti(int index) {
    var urun = vitrinUrunleri[index];
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                // ✨ AKILLI RESİM GÖSTERİCİ: Dosya seçildiyse onu, yoksa linki gösterir
                child: urun['dosyaVerisi'] != null
                    ? Image.memory(urun['dosyaVerisi'],
                        fit: BoxFit.cover, width: double.infinity)
                    : Image.network(urun['resim']!,
                        fit: BoxFit.cover, width: double.infinity),
              )),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    Text(urun['isim']!,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
                        maxLines: 1),
                    Text(urun['fiyat']!,
                        style: const TextStyle(
                            color: Color(0xFFFFB300),
                            fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: const Icon(Icons.add_shopping_cart,
                          color: Color(0xFFFFB300), size: 16),
                      onPressed: () {
                        SepetVerisi.sepettekiUrunler.add({
                          'isim': urun['isim'],
                          'fiyat': urun['fiyat'],
                          'resim': urun['resim'] ?? ''
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Sepete eklendi!")));
                      },
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 2,
            right: 2,
            child: InkWell(
              onTap: () => setState(() => vitrinUrunleri.removeAt(index)),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    color: Colors.black54, shape: BoxShape.circle),
                child:
                    const Icon(Icons.close, color: Colors.redAccent, size: 14),
              ),
            ),
          )
        ],
      ),
    );
  }
}
