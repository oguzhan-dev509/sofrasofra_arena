import 'package:flutter/material.dart';
// NOT: Import yollarını klasör yapına göre 'eski_site/...' şeklinde güncellemen gerekebilir
import 'menu_yoneticisi.dart';

class EskiAnaGirisSayfasi extends StatefulWidget {
  const EskiAnaGirisSayfasi({super.key});

  @override
  State<EskiAnaGirisSayfasi> createState() => _EskiAnaGirisSayfasiState();
}

class _EskiAnaGirisSayfasiState extends State<EskiAnaGirisSayfasi> {
  final List<String> sehirListesi = [
    "Adana",
    "Ankara",
    "Antalya",
    "Aydın",
    "Balıkesir",
    "Batman",
    "Bolu",
    "Bursa",
    "Çanakkale",
    "Denizli",
    "Diyarbakır",
    "Elazığ",
    "Erzurum",
    "Eskişehir",
    "Gaziantep",
    "Giresun",
    "Hatay",
    "İstanbul",
    "İzmir",
    "Kahramanmaraş",
    "Kayseri",
    "Kocaeli",
    "Konya",
    "Kütahya",
    "Malatya",
    "Manisa",
    "Mardin",
    "Mersin",
    "Muğla",
    "Ordu",
    "Rize",
    "Sakarya",
    "Samsun",
    "Sivas",
    "Şanlıurfa",
    "Tekirdağ",
    "Tokat",
    "Trabzon",
    "Van",
    "Zonguldak"
  ];
  String secilenSehir = "İstanbul"; // Varsayılanı İstanbul yaptım kaptan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Zemin her zaman asil siyah
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ✨ ŞAHESER GÖRSEL ALANI
            Stack(
              children: [
                Container(
                  height: 380,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/anadolu_vitrin.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[900],
                      child: const Icon(Icons.image,
                          color: Color(0xFFD4AF37), size: 50),
                    ),
                  ),
                ),
                Container(
                  height: 380,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.2),
                        Colors.black,
                      ],
                      stops: const [0.5, 0.8, 1.0],
                    ),
                  ),
                ),
              ],
            ),
            // ✨ ELİTE GİRİŞ KARTI
            Transform.translate(
              offset: const Offset(0, -40),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xFFD4AF37).withOpacity(0.2),
                          blurRadius: 40,
                          spreadRadius: 5),
                    ],
                    border: Border.all(
                        color: const Color(0xFFD4AF37).withOpacity(0.6),
                        width: 1.5),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33),
                      color: const Color(0xFF1A1A1A),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 25),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [
                                Color(0xFFB8860B),
                                Color(0xFFD4AF37),
                                Color(0xFFFFD700),
                                Color(0xFFB8860B)
                              ],
                            ).createShader(bounds),
                            child: const Text(
                              "SOFRASOFRA ARENA",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.8,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                              height: 1.5,
                              width: 120,
                              color: const Color(0xFFD4AF37).withOpacity(0.4)),
                          const SizedBox(height: 30),
                          const Text("Hangi Şehirdeyiz?",
                              style: TextStyle(
                                  color: Color(0xFFD4AF37),
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(height: 15),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black,
                              border: Border.all(
                                  color:
                                      const Color(0xFFD4AF37).withOpacity(0.3)),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: Colors.black,
                                value: secilenSehir,
                                isExpanded: true,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                                items: sehirListesi
                                    .map((s) => DropdownMenuItem(
                                        value: s, child: Text(s)))
                                    .toList(),
                                onChanged: (v) =>
                                    setState(() => secilenSehir = v!),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          ElevatedButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MenuYoneticisi())),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              minimumSize: const Size(double.infinity, 65),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: const BorderSide(
                                    color: Color(0xFFD4AF37), width: 2),
                              ),
                            ),
                            child: const Text("ARENA'YA GİRİŞ YAP",
                                style: TextStyle(
                                    color: Color(0xFFD4AF37),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    letterSpacing: 1.2)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
