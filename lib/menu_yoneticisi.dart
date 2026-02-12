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
      // --- İŞTE SİHİRLİ DOKUNUŞ BURASI ---
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFFB300),
        child: const Icon(Icons.analytics, color: Colors.black),
        // Kritik nokta burası: Mahalleyi içeri gönderiyoruz!
        onPressed: () => _arenaHizliPanelAc(context, seciliMahalle),
      ),
      // ----------------------------------
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
        title: const Text("KURUMSAL MERKEZ",
            style: TextStyle(
                color: Color(0xFFFFB300),
                fontSize: 16,
                fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // 📢 DUYURU MERKEZİ (CANLI HAT)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFFFB300).withOpacity(0.05),
              borderRadius: BorderRadius.circular(25),
              border:
                  Border.all(color: const Color(0xFFFFB300).withOpacity(0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.campaign,
                        color: Color(0xFFFFB300), size: 28),
                    const SizedBox(width: 15),
                    const Text("ARENA DUYURULARI",
                        style: TextStyle(
                            color: Color(0xFFFFB300),
                            fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                            color: Colors.green, shape: BoxShape.circle)),
                    const SizedBox(width: 5),
                    const Text("AKTİF",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 10,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                    "Yeni sistem güncellemesi yayınlandı! Tüm modüllerde performans iyileştirmesi yapıldı.",
                    style: TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Text("ARENA EKOSİSTEMİ",
              style: TextStyle(
                  color: Colors.white24,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5)),
          const SizedBox(height: 15),

          _kurumsalListeItem(
              context,
              Icons.auto_stories,
              "GASTRONOMİ YOLCULUĞUMUZ",
              "Sofrasofra Arena'nın Vizyonu ve Hikayesi",
              () => _manifestoGoster(context)),
          _kurumsalListeItem(
              context,
              Icons.gavel,
              "KULLANIM SÖZLEŞMESİ",
              "Platform Kuralları ve Abonelik Hakları",
              () => _yasalMetinGoster(
                  context, "KULLANIM SÖZLEŞMESİ", _kullanimMetni)),
          _kurumsalListeItem(
              context,
              Icons.verified_user,
              "AYDINLATMA METNİ",
              "KVKK, Veri Güvenliği ve Çerez Politikası",
              () => _yasalMetinGoster(
                  context, "AYDINLATMA METNİ", _aydinlatmaMetni)),
          _kurumsalListeItem(
              context,
              Icons.contact_support,
              "İLETİŞİM VE DESTEK",
              "Arena Çözüm Merkezi ve Bize Ulaşın",
              () => _destekPaneliGoster(context)),

          const SizedBox(height: 50),
          const Center(
              child: Text("Sofrasofra Arena - Güvenli Gastronomi Ağı",
                  style: TextStyle(color: Colors.white10, fontSize: 10))),
        ],
      ),
    );
  }

  // --- MODALLAR VE YASAL METİNLER ---
  void _manifestoGoster(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF1A1A1A),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.85,
        expand: false,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
                child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(10)))),
            const SizedBox(height: 25),
            const Text("GASTRONOMİ YOLCULUĞUMUZ",
                style: TextStyle(
                    color: Color(0xFFFFB300),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 25),
            const Text(
                "Gelenekten Geleceğe, Sofradan Arena’ya.\n\nGastronomi, sadece bir yemek sunma sanatı değil; bir kültürü yaşatma ve bir emeği onurlandırma yolculuğudur. Türkiye'de bugün iş gücüne katılmayı bekleyen 11 milyondan fazla ev hanımının üretim potansiyeli ve 300 bin gastronomi işletmesinin tecrübesi bizim çıkış noktamızdır. Biz, bu devasa potansiyeli Sofrasofra Arena’da buluşturuyoruz.\n\nSofrasofra, vergi muafiyeti avantajlarını teknolojiyle birleştirerek, mutfağını ekonomiye açmak isteyen ev hanımlarımıza geniş bir alan açıyor. Arena; lokanta ve restoranlara düşük maliyetle hizmet sunurken; yüz binleri aşan usta ve şeflerimizin görünürlüğünü artırmayı görev ediniyor.",
                style: TextStyle(
                    color: Colors.white70, fontSize: 15, height: 1.6)),
            const SizedBox(height: 40),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB300),
                    minimumSize: const Size(double.infinity, 50)),
                onPressed: () => Navigator.pop(context),
                child: const Text("YOLCULUĞA DEVAM ET",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold))),
          ]),
        ),
      ),
    );
  }

  void _yasalMetinGoster(BuildContext context, String baslik, String icerik) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF1A1A1A),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.85,
        expand: false,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
                child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(10)))),
            const SizedBox(height: 25),
            Text(baslik,
                style: const TextStyle(
                    color: Color(0xFFFFB300),
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 25),
            Text(icerik,
                style: const TextStyle(
                    color: Colors.white70, fontSize: 14, height: 1.6)),
            const SizedBox(height: 40),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB300),
                    minimumSize: const Size(double.infinity, 50)),
                onPressed: () => Navigator.pop(context),
                child: const Text("ANLADIM VE ONAYLIYORUM",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold))),
          ]),
        ),
      ),
    );
  }

  void _destekPaneliGoster(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1A1A),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(30),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Text("ARENA ÇÖZÜM MERKEZİ",
              style: TextStyle(
                  color: Color(0xFFFFB300),
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          const SizedBox(height: 25),
          const ListTile(
              leading: Icon(Icons.email, color: Color(0xFFFFB300)),
              title: Text("destek@sofrasofra.com",
                  style: TextStyle(color: Colors.white))),
          const ListTile(
              leading: Icon(Icons.phone, color: Color(0xFFFFB300)),
              title: Text("+90 5xx xxx xx xx",
                  style: TextStyle(color: Colors.white))),
          const SizedBox(height: 20),
          const Text("Arena Uzmanlarımız 7/24 yanınızda.",
              style: TextStyle(color: Colors.white38, fontSize: 12)),
        ]),
      ),
    );
  }

  Widget _kurumsalListeItem(BuildContext context, IconData i, String b,
      String a, VoidCallback tiklama) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.03),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withOpacity(0.05))),
      child: ListTile(
        leading: Icon(i, color: const Color(0xFFFFB300), size: 22),
        title: Text(b,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold)),
        subtitle: Text(a,
            style: const TextStyle(color: Colors.white38, fontSize: 10)),
        trailing: const Icon(Icons.arrow_forward_ios,
            color: Colors.white10, size: 12),
        onTap: tiklama,
      ),
    );
  }

  static const String _kullanimMetni =
      "Bu sözleşme, Sofrasofra Arena platformundaki şeflerin ve ev hanımlarının haklarını korumak adına düzenlenmiştir.\n\n1. Her kullanıcı kendi mutfağının sorumlusudur.\n2. Arena, düşük maliyetli dijital altyapı sunmayı taahhüt eder.\n3. Ticari faaliyetler vergi muafiyeti yönetmeliklerine uygun yürütülmelidir.";
  static const String _aydinlatmaMetni =
      "Verileriniz, Arena'nın güvenli gastronomi ağı içerisinde korunmaktadır.\n\n- Kişisel verileriniz size özel fırsatlar sunmak dışında kullanılmaz.\n- Konum verileriniz dükkanınızın bulunabilirliği için işlenir.\n- Veri silme hakkınız saklıdır.";
}

// --- HIZLI ANALİZ MOTORLARI (AKILLI VERİ BAĞLANTISIYLA) ---
void _arenaHizliPanelAc(BuildContext context, String? mahalle) {
  showModalBottomSheet(
    context: context,
    backgroundColor: const Color(0xFF1A1A1A),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(25),
        height: 420,
        child: Column(
          children: [
            Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(10))),
            const SizedBox(height: 25),
            const Text("ARENA CANLI ÖZET",
                style: TextStyle(
                    color: Color(0xFFFFB300),
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              mahalle != null
                  ? "Analiz Bölgesi: $mahalle"
                  : "Konum Kaydı Bekleniyor...",
              style: TextStyle(
                  color: mahalle != null
                      ? Colors.white38
                      : Colors.redAccent.withOpacity(0.5),
                  fontSize: 12),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            _panelSatir("TOPLAM KAZANÇ", "25.000 ₺", Icons.monetization_on),
            _panelSatir("AKTİF SİPARİŞ", "4 Adet", Icons.shopping_basket),
            _panelSatir("YENİ TEKLİFLER", "2 Adet", Icons.local_offer),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFB300),
                  minimumSize: const Size(double.infinity, 50)),
              onPressed: () => Navigator.pop(context),
              child: const Text("ANALİZİ KAPAT",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      );
    },
  );
}

Widget _panelSatir(String b, String d, IconData i) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        Icon(i, color: const Color(0xFFFFB300), size: 20),
        const SizedBox(width: 15),
        Text(b, style: const TextStyle(color: Colors.white70))
      ]),
      Text(d,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
    ]),
  );
}
