import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PazarYeriAnaSayfa extends StatefulWidget {
  const PazarYeriAnaSayfa({super.key});
  @override
  State<PazarYeriAnaSayfa> createState() => _PazarYeriAnaSayfaState();
}

class _PazarYeriAnaSayfaState extends State<PazarYeriAnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("SOFRASOFRA PAZAR",
            style: TextStyle(color: Color(0xFFFFB300))),
      ),
      body: const Center(
        child: Text("PAZAR YERİ YÜKLENDİ!",
            style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
    );
  }
}
