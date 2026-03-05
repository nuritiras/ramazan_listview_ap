import 'package:flutter/material.dart';
import 'dart:async'; // Timer için gerekli

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImsakiyeDetaySayfasi(),
    ),
  );
}

class ImsakiyeDetaySayfasi extends StatefulWidget {
  @override
  _ImsakiyeDetaySayfasiState createState() => _ImsakiyeDetaySayfasiState();
}

class _ImsakiyeDetaySayfasiState extends State<ImsakiyeDetaySayfasi> {
  late Timer _timer;
  Duration _kalanSure = Duration();

  // Örnek bir iftar vakti: Bugün saat 19:12
  final DateTime iftarVakti = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    19,
    12,
    0,
  );

  @override
  void initState() {
    super.initState();
    _sureyiBaslat();
  }

  void _sureyiBaslat() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      final simdi = DateTime.now();
      setState(() {
        _kalanSure = iftarVakti.difference(simdi);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Sayfadan çıkınca sayacı durdur (Performans için önemli)
    super.dispose();
  }

  // Süreyi HH:MM:SS formatına çeviren yardımcı fonksiyon
  String _formatDuration(Duration duration) {
    if (duration.isNegative) return "Allah kabul etsin!";
    String ikiHane(int n) => n.toString().padLeft(2, "0");
    return "${ikiHane(duration.inHours)}:${ikiHane(duration.inMinutes.remainder(60))}:${ikiHane(duration.inSeconds.remainder(60))}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B5E20),
      appBar: AppBar(
        title: Text("Kahramanmaraş İmsakiye"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          // 1. CANLI SAYAÇ KARTI
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color(0xFFFFD700), width: 1),
            ),
            child: Column(
              children: [
                Text(
                  "İftara Kalan Süre",
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  _formatDuration(_kalanSure),
                  style: TextStyle(
                    color: Color(0xFFFFD700),
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'monospace', // Rakamların kaymaması için
                  ),
                ),
              ],
            ),
          ),

          // 2. VAKİT LİSTESİ
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "6 Mart 2026 - Cuma",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[900],
                      ),
                    ),
                    Divider(height: 30),
                    _vakitSatiri("İmsak", "05:30", Icons.wb_twilight),
                    _vakitSatiri("Güneş", "06:50", Icons.wb_sunny_outlined),
                    _vakitSatiri("Öğle", "12:49", Icons.wb_sunny),
                    _vakitSatiri("İkindi", "16:03", Icons.wb_cloudy_outlined),
                    _vakitSatiri(
                      "Akşam (İftar)",
                      "18:37",
                      Icons.nights_stay,
                      isIftar: true,
                    ),
                    _vakitSatiri("Yatsı", "19:52", Icons.dark_mode),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _vakitSatiri(
    String ad,
    String saat,
    IconData ikon, {
    bool isIftar = false,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isIftar ? Colors.orange[50] : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: isIftar ? Border.all(color: Colors.orange) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                ikon,
                color: isIftar ? Colors.orange[800] : Colors.green[800],
              ),
              SizedBox(width: 15),
              Text(
                ad,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Text(
            saat,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isIftar ? Colors.orange[900] : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
