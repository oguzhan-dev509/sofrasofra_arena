import 'package:flutter/material.dart';

import 'pazar_yeri_ana_sayfa.dart';

class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({super.key});

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  String secilenSehir = "İSTANBUL";

  // 🌍 TÜRKİYE'NİN TÜM İLLERİ + K.K.T.C. (TAM LİSTE)
  final List<String> sehirler = [
    "ADANA",
    "ADIYAMAN",
    "AFYONKARAHİSAR",
    "AĞRI",
    "AKSARAY",
    "AMASYA",
    "ANKARA",
    "ANTALYA",
    "ARDAHAN",
    "ARTVİN",
    "AYDIN",
    "BALIKESİR",
    "BARTIN",
    "BATMAN",
    "BAYBURT",
    "BİLECİK",
    "BİNGÖL",
    "BİTLİS",
    "BOLU",
    "BURDUR",
    "BURSA",
    "ÇANAKKALE",
    "ÇANKIRI",
    "ÇORUM",
    "DENİZLİ",
    "DİYARBAKIR",
    "DÜZCE",
    "EDİRNE",
    "ELAZIĞ",
    "ERZİNCAN",
    "ERZURUM",
    "ESKİŞEHİR",
    "GAZİANTEP",
    "GİRESUN",
    "GÜMÜŞHANE",
    "HAKKARİ",
    "HATAY",
    "IĞDIR",
    "ISPARTA",
    "İSTANBUL",
    "İZMİR",
    "KAHRAMANMARAŞ",
    "KARABÜK",
    "KARAMAN",
    "KARS",
    "KASTAMONU",
    "KAYSERİ",
    "KIRIKKALE",
    "KIRKLARELI",
    "KIRŞEHİR",
    "KİLİS",
    "KOCAELİ",
    "KONYA",
    "KÜTAHYA",
    "MALATYA",
    "MANİSA",
    "MARDİN",
    "MERSİN",
    "MUĞLA",
    "MUŞ",
    "NEVŞEHİR",
    "NİĞDE",
    "ORDU",
    "OSMANİYE",
    "RİZE",
    "SAKARYA",
    "SAMSUN",
    "SİİRT",
    "SİNOP",
    "SİVAS",
    "ŞANLIURFA",
    "ŞIRNAK",
    "TEKİRDAĞ",
    "TOKAT",
    "TRABZON",
    "TUNCELİ",
    "UŞAK",
    "VAN",
    "YALOVA",
    "YOZGAT",
    "ZONGULDAK",
    "K.K.T.C."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Asil siyah zemin
      body: Stack(
        children: [
          // 🖼️ MERKEZDEKİ AYDINLIK SOFRA (IŞIK ÇEMBERİ İÇİNDE)
          Center(
            child: Opacity(
              opacity: 0.8,
              child: Image.asset(
                'assets/images/anadolu_vitrin.jpg', // Senin muhteşem görselin
                fit: BoxFit.contain,
              ),
            ),
          ),

          // 🌕 TEKNOLOJİK AY IŞIĞI (SPOTLIGHT EFEKTİ)
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 0.7,
                colors: [
                  Colors.transparent, // Merkeze (sofraya) vuran berrak ışık
                  Colors.black
                      .withOpacity(0.95), // Kenarlara doğru asil karanlık
                ],
                stops: const [0.3, 1.0],
              ),
            ),
          ),

          // 🏛️ TASARIM KATMANI (BAŞLIKLAR VE LİSTE)
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text("SOFRASOFRA",
                    style: TextStyle(
                        color: Colors.white, fontSize: 16, letterSpacing: 8)),
                const Text("ARENA",
                    style: TextStyle(
                        color: Color(0xFFFFB300),
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4)),
                const Text("LEZZETİN MERKEZİNE HOŞ GELDİNİZ",
                    style: TextStyle(
                        color: Colors.white60, fontSize: 12, letterSpacing: 2)),

                const Spacer(),

                // 🏙️ TAM ŞEHİR LİSTESİ (IŞIĞIN ALTINDA SÜZÜLEN MODERN LİSTE)
                Container(
                  height: 220,
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                    color:
                        Colors.white.withOpacity(0.03), // Çok hafif cam efekti
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: ListView.builder(
                      itemCount: sehirler.length,
                      itemBuilder: (context, index) => ListTile(
                        onTap: () =>
                            setState(() => secilenSehir = sehirler[index]),
                        title: Text(
                          sehirler[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: secilenSehir == sehirler[index]
                                ? const Color(0xFFFFB300)
                                : Colors.white70,
                            fontWeight: secilenSehir == sehirler[index]
                                ? FontWeight.bold
                                : FontWeight.w300,
                            fontSize: secilenSehir == sehirler[index] ? 24 : 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                // 🚀 ARENA'YA GİRİŞ YAP BUTONU (ALTIN ÇERÇEVELİ)
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: InkWell(
                    onTap: () {
                      // Firebase Ana Sayfasına (PazarYeriAnaSayfa) Geçiş
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PazarYeriAnaSayfa()));
                    },
                    child: Container(
                      width: 280,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(35),
                        border: Border.all(
                            color: const Color(0xFFFFB300), width: 2),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xFFFFB300).withOpacity(0.2),
                              blurRadius: 15,
                              spreadRadius: 2)
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "ARENA'YA GİRİŞ YAP",
                          style: TextStyle(
                              color: Color(0xFFFFB300),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
