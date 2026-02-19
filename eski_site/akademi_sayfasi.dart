import 'package:flutter/material.dart';

class AkademiSayfasi extends StatelessWidget {
  const AkademiSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
        title: const Text("AKADEMİ MERKEZİ",
            style: TextStyle(color: Color(0xFFFFB300))),
      ),
      body: const Center(
        child: Text("Akademi İçeriği Yükleniyor...",
            style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
