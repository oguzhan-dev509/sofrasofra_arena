import 'package:flutter/material.dart';
import 'arena_motor.dart';

class SepetSayfasi extends StatelessWidget {
  const SepetSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: arenaSistemi,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
            title: const Text("ARENA SEPETİM",
                style: TextStyle(color: Color(0xFFFFB300))),
          ),
          body: arenaSistemi.sepet.isEmpty
              ? const Center(
                  child: Text("Sepetiniz boş kaptan!",
                      style: TextStyle(color: Colors.white70)))
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: arenaSistemi.sepet.length,
                        itemBuilder: (context, index) {
                          final urun = arenaSistemi.sepet[index];
                          return ListTile(
                            leading: const Icon(Icons.restaurant_menu,
                                color: Color(0xFFFFB300)),
                            title: Text(urun['isim'],
                                style: const TextStyle(color: Colors.white)),
                            subtitle: Text(urun['fiyat'],
                                style:
                                    const TextStyle(color: Color(0xFFFFB300))),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_sweep,
                                  color: Colors.redAccent),
                              onPressed: () =>
                                  arenaSistemi.sepettenCikar(index),
                            ),
                          );
                        },
                      ),
                    ),
                    _toplamBolumu(),
                  ],
                ),
        );
      },
    );
  }

  Widget _toplamBolumu() {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
          color: Color(0xFF111111),
          border: Border(top: BorderSide(color: Colors.white10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("TOPLAM:",
              style: TextStyle(color: Colors.white70, fontSize: 18)),
          Text("${arenaSistemi.toplamFiyat.toStringAsFixed(0)} ₺",
              style: const TextStyle(
                  color: Color(0xFFFFB300),
                  fontSize: 26,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
