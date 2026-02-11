import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'dukkan_kurulum_merkezi.dart';
import 'vitrin_merkezi.dart';

class MenuYoneticisi extends StatefulWidget {
  const MenuYoneticisi({super.key});

  @override
  State<MenuYoneticisi> createState() => _MenuYoneticisiState();
}

class _MenuYoneticisiState extends State<MenuYoneticisi> {
  String? seciliMahalle;

  // 18.211 KÖYÜ SÜZECEK OLAN AKILLI MOTOR
  Future<List<String>> konumAra(String sorgu) async {
    if (sorgu.length < 3) return [];
    try {
      final String response =
          await rootBundle.loadString('assets/data/turkiye_rehberi.json');
      final List<dynamic> data = json.decode(response);
      return data
          .where((yer) =>
              yer.toString().toLowerCase().contains(sorgu.toLowerCase()))
          .take(15)
          .toList()
          .cast<String>();
    } catch (e) {
      return ["Veri yüklenemedi"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text("SOFRASOFRA ARENASI",
            style: TextStyle(
                color: Color(0xFFFFB300),
                fontWeight: FontWeight.w900,
                letterSpacing: 2)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // --- AKILLI KONUM KAYDETME MOTORU ---
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("DÜKKAN KONUMUNU KAYDET",
                  style: TextStyle(
                      color: Color(0xFFFFB300), fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return konumAra(textEditingValue.text);
                },
                onSelected: (String secim) {
                  setState(() {
                    seciliMahalle = secim;
                  });
                },
                fieldViewBuilder:
                    (context, controller, focusNode, onFieldSubmitted) {
                  return TextField(
                    controller: controller,
                    focusNode: focusNode,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: InputDecoration(
                      hintText: "İlçe, Mahalle veya Köyünüzü Yazın...",
                      hintStyle:
                          const TextStyle(color: Colors.white24, fontSize: 13),
                      prefixIcon: const Icon(Icons.search,
                          color: Color(0xFFFFB300), size: 18),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.05),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  );
                },
                optionsViewBuilder: (context, onSelected, options) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      color: const Color(0xFF1A1A1A),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: options.length,
                          itemBuilder: (context, index) {
                            // itemBuilder DOĞRU YAZILDI
                            final String option = options.elementAt(index);
                            return ListTile(
                              title: Text(option,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 13)),
                              onTap: () => onSelected(option),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.white10),
              const SizedBox(height: 20),
            ],
          ),

          // --- ARENA MODÜLLERİ ---
          _arenaSatiri(context, "DÜKKANIMI KUR", "İşletme & Yasal Kayıt",
              Icons.store, const DukkanKurulumMerkezi(), true),
          _arenaSatiri(context, "VİTRİNİM", "Medya & Tanıtım", Icons.videocam,
              const VitrinMerkeziSayfasi(), false),
          _arenaSatiri(context, "AKADEMİM", "EĞİTİM & GELİŞİM", Icons.school,
              const AkademiMerkezi(), false),
          _arenaSatiri(context, "DASHBOARD", "İşletme Özeti", Icons.analytics,
              const DashboardMerkezi(), false),
          _arenaSatiri(context, "PAZARIM", "Özel Davetler", Icons.shopping_bag,
              const PazarimMerkezi(), false),
          _arenaSatiri(context, "KURUMSAL", "Yasal Yönetim", Icons.gavel,
              const KurumsalMerkezi(), false),
        ],
      ),
    );
  }

  Widget _arenaSatiri(BuildContext context, String baslik, String alt,
      IconData ikon, Widget sayfa, bool vurgu) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: vurgu
            ? const Color(0xFFFFB300).withOpacity(0.05)
            : Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border:
            Border.all(color: vurgu ? const Color(0xFFFFB300) : Colors.white10),
      ),
      child: ListTile(
        leading: Icon(ikon, color: const Color(0xFFFFB300)),
        title: Text(baslik,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        subtitle: Text(alt,
            style: const TextStyle(color: Colors.white38, fontSize: 12)),
        trailing: const Icon(Icons.arrow_forward_ios,
            size: 14, color: Colors.white24),
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => sayfa)),
      ),
    );
  }
}

// --- AKADEMİ MERKEZİ (TAM KAPASİTE GERİ DÖNDÜ) ---
class AkademiMerkezi extends StatelessWidget {
  const AkademiMerkezi({super.key});

  void _egitimiBaslat(BuildContext context, String baslik, String icerik) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1A1A),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(baslik,
                style: const TextStyle(
                    color: Color(0xFFFFB300),
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Text(icerik,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFB300)),
              child: const Text("EĞİTİME BAŞLA",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("SOFRASOFRA AKADEMİ",
              style: TextStyle(color: Color(0xFFFFB300)))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text("EĞİTİM KATEGORİLERİ",
              style: TextStyle(
                  color: Color(0xFFFFB300),
                  fontSize: 13,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _aktifKart(
              context,
              Icons.restaurant_menu,
              "Masterclass: Teknik & Sunum",
              "Michelin standartlarında tabaklama."),
          _aktifKart(context, Icons.business, "Girişimci Şef El Kitabı",
              "Maliyet hesabı ve dükkan yönetimi."),
          const SizedBox(height: 30),
          _aktifKart(context, Icons.eco, "Sürdürülebilir Mutfak & Sıfır Atık",
              "Malzemeyi %100 kullanma ve kârlılık."),
          _aktifKart(context, Icons.psychology_alt, "AI Destekli Gastronomi",
              "AI ile menü planlama ve tasarım."),
          const SizedBox(height: 40),
          const Text("HIZLANDIRILMIŞ EĞİTİMLER",
              style: TextStyle(
                  color: Color(0xFFFFB300),
                  fontSize: 13,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _egitimGrubu("AŞÇILIK", Icons.flatware,
              ["Türk Mutfağı", "Dünya Mutfağı", "Pişirme Teknikleri"]),
          _egitimGrubu("PASTACILIK", Icons.bakery_dining,
              ["Pasta Teknikleri", "Çikolata", "Tatlılar"]),
          _egitimGrubu("KAFE İŞLETMECİLİĞİ", Icons.coffee,
              ["Maliyet", "Personel", "Pazarlama"]),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _aktifKart(BuildContext context, IconData i, String b, String a) {
    return InkWell(
      onTap: () => _egitimiBaslat(context, b, a),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white10)),
        child: Row(children: [
          Icon(i, color: const Color(0xFFFFB300), size: 30),
          const SizedBox(width: 20),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(b,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text(a,
                    style: const TextStyle(color: Colors.white38, fontSize: 10))
              ])),
          const Icon(Icons.play_circle_fill, color: Color(0xFFFFB300))
        ]),
      ),
    );
  }

  Widget _egitimGrubu(String b, IconData i, List<String> m) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.02),
          borderRadius: BorderRadius.circular(15)),
      child: ExpansionTile(
        leading: Icon(i, color: const Color(0xFFFFB300)),
        title: Text(b,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14)),
        iconColor: const Color(0xFFFFB300),
        collapsedIconColor: Colors.white24,
        children: m
            .map((e) => ListTile(
                  leading: const Icon(Icons.check,
                      color: Color(0xFFFFB300), size: 16),
                  title: Text(e,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 13)),
                ))
            .toList(),
      ),
    );
  }
}

// Diğer modüller
class DashboardMerkezi extends StatelessWidget {
  const DashboardMerkezi({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.black,
      body: const Center(child: Text("Yükleniyor...")));
}

class PazarimMerkezi extends StatelessWidget {
  const PazarimMerkezi({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.black,
      body: const Center(child: Text("Pazarım")));
}

class KurumsalMerkezi extends StatelessWidget {
  const KurumsalMerkezi({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.black,
      body: const Center(child: Text("Kurumsal")));
}
