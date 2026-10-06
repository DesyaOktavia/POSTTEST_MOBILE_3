import 'package:flutter/material.dart';
import '../models/diabetes_calc.dart';
import 'detail_saran_page.dart';

// Halaman Kalkulator Diabetes
class CalculatorPage extends StatefulWidget {
  final Function(RiwayatPemeriksaan) onTambahRiwayat;

  // Constructor
  const CalculatorPage({
    super.key,
    required this.onTambahRiwayat,
  });

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  // Controller
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _gulaController = TextEditingController();

  // State Variable = Null Safety
  double? inputGula;
  String namaPasien = '';
  String hasil = 'Belum Ada Hasil';
  String keterangan = 'Silakan masukkan kadar gula darah Anda, lalu tekan tombol Hitung.';
  bool isHitungSukses = false;

  // List dari Class Static
  List<String> tipsList = DiabetesCalc.tipsKesehatanList;

  // Set dari Class Static
  Set<String> kategoriSet = DiabetesCalc.daftarKategoriSet;

  // Map dari Class Static
  Map<String, String> infoMap = DiabetesCalc.infoKategoriMap;

  // kalkulasi gula darah dan simpan riwayat
  void hitungGula() {
    String teksGula = _gulaController.text.trim();
    String teksNama = _namaController.text.trim();

    // setState untuk memperbarui state dan merefresh tampilan UI
    setState(() {
      namaPasien = teksNama;
      inputGula = double.tryParse(teksGula);

      if (inputGula != null && inputGula! > 0) {
        DiabetesCalc calc = DiabetesCalc(
          gulaDarah: inputGula,
          namaPasien: namaPasien,
        );

        // Method Positional Parameter & Named Parameter
        hasil = calc.cekStatus(inputGula!, satuan: 'mg/dL');
        keterangan = infoMap[hasil] ?? 'Keterangan tidak ditemukan.';
        isHitungSukses = true;

        // Simpan data ke riwayat
        widget.onTambahRiwayat(
          RiwayatPemeriksaan(
            nama: namaPasien.isNotEmpty ? namaPasien : 'Pengguna',
            gulaDarah: inputGula!,
            status: hasil,
            waktu:
            '${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}',
          ),
        );

        // Notifikasi visual data berhasil dihitung & disimpan
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Data $hasil berhasil disimpan ke Riwayat!',
            ),
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );
      } else {
        hasil = 'Belum Ada Hasil';
        keterangan = 'Masukkan angka kadar gula yang valid (> 0).';
        isHitungSukses = false;
      }
    });
  }

  // Method/Function untuk mereset form input dengan setState
  void resetForm() {
    setState(() {
      _namaController.clear();
      _gulaController.clear();
      namaPasien = '';
      inputGula = null;
      hasil = 'Belum Ada Hasil';
      keterangan = 'Silakan masukkan kadar gula darah Anda, lalu tekan tombol Hitung.';
      isHitungSukses = false;
    });
  }

  @override
  void dispose() {
    _namaController.dispose();
    _gulaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Widget: SafeArea
    return SafeArea(
      // Widget: SingleChildScrollView
      child: SingleChildScrollView(
        // Widget: Padding
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // Widget: Column
          child: Column(
            children: [
              // Header
              // Widget: Container
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade400,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // Widget: Row
                child: Row(
                  children: [
                    // Widget: Icon
                    const Icon(
                      Icons.medical_services,
                      color: Colors.white,
                      size: 32.0,
                    ),
                    // Widget: SizedBox
                    const SizedBox(width: 12.0),
                    // Widget: Expanded
                    Expanded(
                      // Widget: Text
                      child: const Text(
                        'Kalkulator Diabetes',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Widget: SizedBox
              const SizedBox(height: 16.0),

              // Form Input
              // Widget: Container
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  // BoxShadow Widget (Modul 3)
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                // Widget: Column
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Widget: Text
                    const Text(
                      'Nama Pasien (Opsional):',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Widget: SizedBox
                    const SizedBox(height: 6.0),
                    // Widget: Row
                    Row(
                      children: [
                        // Widget: Expanded
                        Expanded(
                          // Widget: TextField
                          child: TextField(
                            controller: _namaController,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              hintText: 'Masukkan nama pasien',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 10.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Widget: SizedBox
                    const SizedBox(height: 12.0),

                    // Widget: Text
                    const Text(
                      'Masukkan Kadar Gula Darah (mg/dL):',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Widget: SizedBox
                    const SizedBox(height: 6.0),
                    // Widget: Row
                    Row(
                      children: [
                        // Widget: Expanded
                        Expanded(
                          // Widget: TextField (Perhitungan & simpan dilakukan saat tombol Hitung diklik)
                          child: TextField(
                            controller: _gulaController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Contoh: 110',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 10.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Widget: SizedBox
                    const SizedBox(height: 14.0),

                    // Tombol Hitung & Reset
                    // Widget: Row
                    Row(
                      children: [
                        // Widget: Expanded
                        Expanded(
                          child: GestureDetector(
                            onTap: hitungGula,
                            // Widget: Container
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.lightBlue.shade400,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              // Widget: Row
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Widget: Icon (Icon gambar catatan/assignment)
                                  Icon(
                                    Icons.assignment,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  // Widget: SizedBox
                                  SizedBox(width: 6.0),
                                  // Widget: Text
                                  Text(
                                    'SIMPAN',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Widget: SizedBox
                        const SizedBox(width: 10.0),
                        // Widget: Expanded
                        Expanded(
                          child: GestureDetector(
                            onTap: resetForm,
                            // Widget: Container
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              // Widget: Row
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Widget: Icon
                                  Icon(
                                    Icons.refresh,
                                    color: Colors.black87,
                                    size: 20,
                                  ),
                                  // Widget: SizedBox
                                  SizedBox(width: 6.0),
                                  // Widget: Text
                                  Text(
                                    'Reset',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Widget: SizedBox
              const SizedBox(height: 16.0),

              // Box Hasil
              // Widget: Container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  // BoxShadow Widget (Modul 3)
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                // Widget: Column
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Widget: Text
                    const Text(
                      'Hasil Pemeriksaan:',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Widget: SizedBox
                    const SizedBox(height: 8.0),
                    // Widget: Text
                    Text(
                      hasil,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: isHitungSukses
                            ? Colors.lightBlue.shade800
                            : Colors.grey.shade700,
                      ),
                    ),
                    // Widget: SizedBox
                    const SizedBox(height: 4.0),
                    // Widget: Text
                    Text(
                      keterangan,
                      style: const TextStyle(fontSize: 13.0, height: 1.3),
                    ),
                    // Widget: SizedBox
                    const SizedBox(height: 14.0),

                    // Tombol Navigasi ke Halaman Detail (Modul 3: Navigasi Navigator.push)
                    if (isHitungSukses)
                      GestureDetector(
                        onTap: () {
                          // Navigator.push Widget (Modul 3)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailSaranPage(
                                namaPasien: namaPasien,
                                nilaiGula: inputGula!,
                                status: hasil,
                                keterangan: keterangan,
                              ),
                            ),
                          );
                        },
                        // Widget: Container
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 16.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.lightBlue.shade400,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          // Widget: Row
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Widget: Icon
                              Icon(
                                Icons.info_outline,
                                color: Colors.white,
                                size: 18,
                              ),
                              // Widget: SizedBox
                              SizedBox(width: 8.0),
                              // Widget: Text
                              Text(
                                'Lihat Detail Rekomendasi',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Widget: SizedBox
              const SizedBox(height: 16.0),

              // Tips Kesehatan (Collections: List & Set)
              // Widget: Container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                // Widget: Column
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Widget: Text
                    Text(
                      'Tips Umum Pencegahan (${kategoriSet.first}):',
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Widget: SizedBox
                    const SizedBox(height: 8.0),
                    // Widget: Text
                    Text('- ${tipsList[0]}'),
                    // Widget: SizedBox
                    const SizedBox(height: 4.0),
                    // Widget: Text
                    Text('- ${tipsList[1]}'),
                    // Widget: SizedBox
                    const SizedBox(height: 4.0),
                    // Widget: Text
                    Text('- ${tipsList[2]}'),
                    // Widget: SizedBox
                    const SizedBox(height: 4.0),
                    // Widget: Text
                    Text('- ${tipsList[3]}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
