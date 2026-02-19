import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

class DukkanKurulumMerkezi extends StatefulWidget {
  const DukkanKurulumMerkezi({super.key});

  @override
  State<DukkanKurulumMerkezi> createState() => _DukkanKurulumMerkeziState();
}

class _DukkanKurulumMerkeziState extends State<DukkanKurulumMerkezi> {
  String _mutfakTipi = "RESTORAN";
  List<XFile?> _kurulumGaleri = List.generate(18, (index) => null);

  XFile? _vergiLevhasi;
  XFile? _hijyenBelgesi;
  XFile? _ikametgah;

  final TextEditingController _adController = TextEditingController();
  final TextEditingController _ibanController = TextEditingController();
  final TextEditingController _telController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("DÜKKAN KURULUM MERKEZİ",
            style: TextStyle(
                color: Color(0xFFFFB300),
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- GÖZE HİTAP EDEN DEV DENEME BANDI (DÜZELTİLDİ) ---
            _buyukDenemeBandi(),

            const SizedBox(height: 10),

            // --- 1. ADIM: DÜKKAN KİMLİĞİ ---
            _bolumBasligi("1. DÜKKAN KİMLİĞİ VE TİCARET"),
            _inputAlani(Icons.store, "İşletme Adı", _adController,
                "Dükkanınızın adı nedir?"),
            _inputAlani(Icons.phone, "WhatsApp Hattı", _telController,
                "Örn: 905XXXXXXXXX"),
            _inputAlani(Icons.account_balance, "Banka IBAN", _ibanController,
                "Ödemeleriniz için TR00..."),

            _mutfakTipiSecici(),

            // --- 2. ADIM: YASAL BELGELER ---
            _bolumBasligi("2. YASAL GÜVENLİK MÜHRÜ"),
            _yasalBelgeBolumu(),

            // --- 3. ADIM: VİTRİN SANATI ---
            _bolumBasligi("3. VİTRİN TASARIMI (18 Kare)"),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: _kurulumIzgarasi()),

            const SizedBox(height: 40),
            _dunyayaAcButonu(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buyukDenemeBandi() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [const Color(0xFFFFB300).withOpacity(0.2), Colors.black]),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: const Color(0xFFFFB300).withOpacity(0.5), width: 2),
      ),
      child: Column(
        children: [
          const Icon(Icons.stars, color: Color(0xFFFFB300), size: 40),
          const SizedBox(height: 10),
          const Text(
            "30 GÜN ÜCRETSİZ DENEME",
            style: TextStyle(
                color: Color(0xFFFFB300),
                fontSize: 20,
                fontWeight: FontWeight
                    .w900, // DÜZELTİLDİ: FontWeight.black yerine w900 kullanıldı
                letterSpacing: 1.5),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          const Text(
            "Kredi kartı gerekmez, hemen dükkanını aç!",
            style: TextStyle(color: Colors.white70, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _bolumBasligi(String baslik) => Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(baslik,
              style: const TextStyle(
                  color: Color(0xFFFFB300),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2)),
        ),
      );

  Widget _yasalBelgeBolumu() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.02),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_mutfakTipi == "RESTORAN") ...[
            _belgeSatiri("Vergi Levhası (Zorunlu)", _vergiLevhasi,
                (f) => setState(() => _vergiLevhasi = f)),
            _belgeSatiri("Hijyen Sertifikası", _hijyenBelgesi,
                (f) => setState(() => _hijyenBelgesi = f)),
          ] else ...[
            _belgeSatiri(
                "Vergi Levhası veya İkametgah",
                (_vergiLevhasi ?? _ikametgah),
                (f) => setState(() => _ikametgah = f)),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("* Ev hanımları için ikametgah yeterlidir.",
                  style: TextStyle(color: Colors.white24, fontSize: 10)),
            ),
          ],
        ],
      ),
    );
  }

  Widget _inputAlani(IconData i, String e, TextEditingController c, String h) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: TextField(
          controller: c,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: Icon(i, color: const Color(0xFFFFB300), size: 20),
            labelText: e,
            hintText: h,
            hintStyle: const TextStyle(color: Colors.white10, fontSize: 10),
            labelStyle: const TextStyle(color: Colors.white38, fontSize: 12),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white10)),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFFB300))),
          ),
        ),
      );

  Widget _belgeSatiri(String ad, XFile? dosya, Function(XFile) onSec) =>
      ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(dosya == null ? Icons.upload_file : Icons.check_circle,
            color: dosya == null ? Colors.white24 : Colors.greenAccent),
        title: Text(ad,
            style: const TextStyle(color: Colors.white70, fontSize: 11)),
        trailing: TextButton(
            onPressed: () async {
              final f =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (f != null) onSec(f);
            },
            child: Text(dosya == null ? "YÜKLE" : "GÜNCELLE",
                style: const TextStyle(color: Color(0xFFFFB300)))),
      );

  Widget _kurulumIzgarasi() => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6, crossAxisSpacing: 8, mainAxisSpacing: 8),
        itemCount: 18,
        itemBuilder: (c, i) => Stack(children: [
          GestureDetector(
            onTap: () async {
              final r =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (r != null) setState(() => _kurulumGaleri[i] = r);
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(8),
                    image: _kurulumGaleri[i] != null
                        ? DecorationImage(
                            image: kIsWeb
                                ? NetworkImage(_kurulumGaleri[i]!.path)
                                : FileImage(File(_kurulumGaleri[i]!.path))
                                    as ImageProvider,
                            fit: BoxFit.cover)
                        : null),
                child: _kurulumGaleri[i] == null
                    ? const Icon(Icons.add_a_photo,
                        color: Color(0xFFFFB300), size: 12)
                    : null),
          ),
          if (_kurulumGaleri[i] != null)
            Positioned(
                right: -2,
                top: -2,
                child: InkWell(
                    onTap: () => setState(() => _kurulumGaleri[i] = null),
                    child: const Icon(Icons.cancel,
                        color: Colors.redAccent, size: 18))),
        ]),
      );

  Widget _mutfakTipiSecici() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(children: [
        _tipKutusu("EV MUTFAĞI", Icons.home),
        const SizedBox(width: 15),
        _tipKutusu("RESTORAN", Icons.restaurant)
      ]));
  Widget _tipKutusu(String t, IconData i) {
    bool s = _mutfakTipi == t;
    return Expanded(
        child: GestureDetector(
            onTap: () => setState(() => _mutfakTipi = t),
            child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: s
                        ? const Color(0xFFFFB300).withOpacity(0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: s ? const Color(0xFFFFB300) : Colors.white10)),
                child: Column(children: [
                  Icon(i, color: s ? const Color(0xFFFFB300) : Colors.white38),
                  const SizedBox(height: 5),
                  Text(t,
                      style: TextStyle(
                          color: s ? Colors.white : Colors.white38,
                          fontSize: 10))
                ]))));
  }

  Widget _dunyayaAcButonu() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFB300),
              minimumSize: const Size(double.infinity, 60),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: () {
            showDialog(
                context: context,
                builder: (c) => AlertDialog(
                        backgroundColor: Colors.black,
                        title: const Text("HOŞ GELDİN ŞEF!",
                            style: TextStyle(color: Color(0xFFFFB300))),
                        content: const Text(
                            "Dükkanın mühürlendi. 30 gün boyunca arenanın keyfini çıkar!",
                            style: TextStyle(color: Colors.white70)),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(c),
                              child: const Text("HADİ BAŞLAYALIM",
                                  style: TextStyle(color: Color(0xFFFFB300))))
                        ]));
          },
          child: const Text("DÜKKANIMI DÜNYAYA AÇ",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
        ),
      );
}
