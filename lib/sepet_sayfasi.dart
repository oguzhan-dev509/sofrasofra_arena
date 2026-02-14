import 'package:flutter/material.dart';
import 'isletme_verisi.dart';

class SepetSayfasi extends StatefulWidget {
  const SepetSayfasi({super.key});

  @override
  State<SepetSayfasi> createState() => _SepetSayfasiState();
}

List<Map<String, dynamic>> sepetim = [];

class _SepetSayfasiState extends State<SepetSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:
            const Text("SEPETİM", style: TextStyle(color: Color(0xFFFFB300))),
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
      ),
      body: sepetim.isEmpty
          ? const Center(
              child:
                  Text("Sepetiniz boş.", style: TextStyle(color: Colors.grey)))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: sepetim.length,
                    itemBuilder: (context, index) {
                      final urun = sepetim[index];
                      return ListTile(
                        leading:
                            Icon(urun['ikon'], color: const Color(0xFFFFB300)),
                        title: Text(urun['ad'],
                            style: const TextStyle(color: Colors.white)),
                        subtitle: Text(urun['fiyat'],
                            style: const TextStyle(color: Color(0xFFFFB300))),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle_outline,
                              color: Colors.red),
                          onPressed: () {
                            setState(() {
                              sepetim.removeAt(index);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFB300),
                      minimumSize: const Size(double.infinity, 60),
                    ),
                    onPressed: () {},
                    child: const Text("ÖDEMEYE GEÇ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
    );
  }
}
