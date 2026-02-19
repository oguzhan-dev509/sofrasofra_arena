// ✨ BUTONUN onPressed KISMINI TAMAMEN BU ŞEKİLDE GÜNCELLE ✨
onPressed: () async { // Buraya 'async' eklemeyi unutma!
  String girilenIsim = dukkanAdiController.text.toUpperCase();
  
  if (girilenIsim.isNotEmpty) {
    // 1️⃣ Hafızaya mühürle
    await DukkanVerisi.ismiKaydet(girilenIsim);

    // 2️⃣ Başarı mesajını göster
    if (context.mounted) { // Güvenlik kontrolü
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: const Color(0xFF1E1E1E),
          title: const Text("BAŞARILI!", style: TextStyle(color: Color(0xFFFFB300))),
          content: Text("$girilenIsim dükkanın başarıyla mühürlendi."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Diyaloğu kapat
                Navigator.pop(context); // Sayfayı kapat, Arena'ya dön
              },
              child: const Text("TAMAM", style: TextStyle(color: Color(0xFFFFB300))),
            ),
          ],
        ),
      );
    }
  }
},