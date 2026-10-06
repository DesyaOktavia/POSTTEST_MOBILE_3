import 'package:flutter/material.dart';
import '../models/diabetes_calc.dart';
import 'calculator_page.dart';
import 'history_page.dart';

// Halaman Utama
class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  // Indeks Tab aktif
  int _currentIndex = 0;

  // simpan riwayat pemeriksaan
  final List<RiwayatPemeriksaan> _daftarRiwayat = [];

  // menambah riwayat
  void _tambahRiwayat(RiwayatPemeriksaan riwayat) {
    setState(() {
      _daftarRiwayat.insert(0, riwayat);
    });
  }

  // menghapus seluruh riwayat
  void _hapusSemuaRiwayat() {
    setState(() {
      _daftarRiwayat.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    // List halaman tab
    final List<Widget> pages = [
      CalculatorPage(onTambahRiwayat: _tambahRiwayat),
      HistoryPage(
        daftarRiwayat: _daftarRiwayat,
        onHapusSemua: _hapusSemuaRiwayat,
      ),
    ];

    // Scaffold
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      body: pages[_currentIndex],

      // Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          // Memperbarui State ketika tab item diklik
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.lightBlue.shade800,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Kalkulator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
        ],
      ),
    );
  }
}
