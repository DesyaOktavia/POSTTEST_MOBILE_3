import 'package:flutter/material.dart';

// Halaman Detail Rekomendasi
class DetailSaranPage extends StatelessWidget {
  final String namaPasien;
  final double nilaiGula;
  final String status;
  final String keterangan;

  // Constructor
  const DetailSaranPage({
    super.key,
    required this.namaPasien,
    required this.nilaiGula,
    required this.status,
    required this.keterangan,
  });

  // Method Positional Parameter, mengembalikan List<String>
  List<String> getLangkahTindakan(String statusPemeriksaan) {
    if (statusPemeriksaan == 'Hipoglikemia (Rendah)') {
      return [
        'Segera konsumsi 15-20 gram karbohidrat cepat serap (jus buah, teh manis, permen).',
        'Istirahat sejenak dan periksa kembali kadar gula darah setelah 15 menit.',
        'Jika kondisi belum membaik atau muncul pusing hebat, segera hubungi dokter.',
      ];
    } else if (statusPemeriksaan == 'Normal') {
      return [
        'Tetap pertahankan pola makan seimbang dengan asupan gizi yang proporsional.',
        'Jaga aktivitas fisik harian secara rutin minimal 150 menit per minggu.',
        'Menjaga daya tahan tubuh dengan pola tidur cukup dan kelola stres dengan baik.',
      ];
    } else if (statusPemeriksaan == 'Pra-Diabetes') {
      return [
        'Batasi konsumsi makanan dan minuman berindeks glikemik tinggi (gula sederhana).',
        'Perbanyak konsumsi serat (sayuran, buah segar, biji-bijian) untuk memperlambat penyerapan gula.',
        'Rutin melakukan olahraga sedang seperti jalan cepat, jogging, atau berenang.',
        'Lakukan pemantauan gula darah secara berkala setiap 3-6 bulan.',
      ];
    } else if (statusPemeriksaan == 'Diabetes Melitus') {
      return [
        'Konsultasikan hasil pemeriksaan ini kepada dokter atau fasilitas kesehatan.',
        'Patuhi petunjuk konsumsi obat antidiabetes atau terapi insulin dari dokter.',
        'Hindari makanan dan minuman manis berlebih serta ganti karbohidrat sederhana ke karbohidrat kompleks.',
        'Lakukan olahraga teratur 30 menit per hari dan pantau kondisi gula darah secara mandiri.',
      ];
    } else {
      return [
        'Silakan masukkan angka kadar gula darah pada kalkulator untuk melihat langkah tindakan.',
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    // Memanggil method untuk mendapatkan daftar langkah tindakan berdasarkan status
    List<String> daftarTindakan = getLangkahTindakan(status);

    // Widget: Scaffold
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      // Widget: SafeArea
      body: SafeArea(
        // Widget: SingleChildScrollView
        child: SingleChildScrollView(
          // Widget: Column
          child: Column(
            children: [
              // Stack Widget (Widget Lanjutan Modul 3)
              Stack(
                children: [
                  // Widget: Container Header Banner
                  Container(
                    height: 150.0,
                    width: double.infinity,
                    color: Colors.lightBlue.shade400,
                  ),
                  // Positioned Widget (Tombol Kembali)
                  Positioned(
                    top: 16.0,
                    left: 16.0,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.pop Widget (Modul 3: Navigasi Back)
                        Navigator.pop(context);
                      },
                      // Widget: Container
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        // Widget: Icon
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                  // Positioned Widget (Judul Banner Header)
                  Positioned(
                    bottom: 20.0,
                    left: 16.0,
                    right: 16.0,
                    // Widget: Row
                    child: Row(
                      children: [
                        // Widget: Icon
                        const Icon(
                          Icons.medical_services,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        // Widget: SizedBox
                        const SizedBox(width: 10.0),
                        // Widget: Expanded
                        Expanded(
                          // Widget: Text
                          child: const Text(
                            'Rekomendasi Kesehatan Detail',
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Widget: SizedBox
              const SizedBox(height: 16.0),

              // Content Box
              // Widget: Padding
              Padding(
                padding: const EdgeInsets.all(16.0),
                // Widget: Container
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    // BoxShadow Widget (Modul 3)
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  // Widget: Column
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Widget: Text
                      Text(
                        'Pasien: ${namaPasien.isNotEmpty ? namaPasien : 'Pengguna'}',
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Widget: SizedBox
                      const SizedBox(height: 6.0),
                      // Widget: Text
                      Text(
                        'Kadar Gula Darah: $nilaiGula mg/dL',
                        style: const TextStyle(fontSize: 14.0),
                      ),
                      // Widget: SizedBox
                      const SizedBox(height: 12.0),
                      // Widget: Text
                      const Text(
                        'Status Diagnosa:',
                        style: TextStyle(fontSize: 13.0, color: Colors.grey),
                      ),
                      // Widget: SizedBox
                      const SizedBox(height: 4.0),
                      // Widget: Text
                      Text(
                        status,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue.shade800,
                        ),
                      ),
                      // Widget: SizedBox
                      const SizedBox(height: 12.0),
                      // Widget: Text
                      const Text(
                        'Penjelasan Keterangan:',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Widget: SizedBox
                      const SizedBox(height: 4.0),
                      // Widget: Text
                      Text(
                        keterangan,
                        style: const TextStyle(fontSize: 13.0, height: 1.4),
                      ),
                      // Widget: SizedBox
                      const SizedBox(height: 16.0),
                      // Widget: Text
                      const Text(
                        'Langkah Tindakan Sehari-hari:',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Widget: SizedBox
                      const SizedBox(height: 8.0),

                      // Looping daftarTindakan
                      // Widget: Column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          daftarTindakan.length,
                              (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            // Widget: Row
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Widget: Text
                                Text(
                                  '${index + 1}. ',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0,
                                  ),
                                ),
                                // Widget: Expanded
                                Expanded(
                                  // Widget: Text
                                  child: Text(
                                    daftarTindakan[index],
                                    style: const TextStyle(
                                      fontSize: 13.0,
                                      height: 1.3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Widget: SizedBox
                      const SizedBox(height: 20.0),

                      // Tombol Kembali
                      GestureDetector(
                        onTap: () {
                          // Navigator.pop Widget (Modul 3)
                          Navigator.pop(context);
                        },
                        // Widget: Container
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Colors.lightBlue.shade400,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          // Widget: Row
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Widget: Icon
                              Icon(Icons.arrow_back, color: Colors.white),
                              // Widget: SizedBox
                              SizedBox(width: 8.0),
                              // Widget: Text
                              Text(
                                'Kembali ke Kalkulator',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
