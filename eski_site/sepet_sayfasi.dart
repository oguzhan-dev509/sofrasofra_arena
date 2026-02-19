import 'package:flutter/material.dart';
import 'arena_kontrol.dart'; // Yeni mühür

class SepetSayfasi extends StatelessWidget {
  const SepetSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: arenaSistemiV2,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text("ARENA SEPETİM")),
          body: arenaSistemiV2.sepetListesi.isEmpty
              ? const Center(child: Text("Sepetiniz boş kaptan!"))
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: arenaSistemiV2.sepetListesi.length,
                        itemBuilder: (context, index) {
                          var urun = arenaSistemiV2.sepetListesi[index];
                          return ListTile(
                            title: Text(urun['isim'],
                                style: const TextStyle(color: Colors.white)),
                            trailing: Text(urun['fiyat'],
                                style:
                                    const TextStyle(color: Color(0xFFFFB300))),
                            onLongPress: () =>
                                arenaSistemiV2.sepettenUrunCikar(index),
                          );
                        },
                      ),
                    ),
                    // 💰 HATALI OLAN TOPLAM SATIRINI BÖYLE DÜZELTTİK:
                    Container(
                      padding: const EdgeInsets.all(30),
                      color: const Color(0xFF1A1A1A),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("TOPLAM:",
                              style: TextStyle(color: Colors.white)),
                          Text(
                              "${arenaSistemiV2.sepetToplami.toStringAsFixed(0)} ₺",
                              style: const TextStyle(
                                  color: Color(0xFFFFB300),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
