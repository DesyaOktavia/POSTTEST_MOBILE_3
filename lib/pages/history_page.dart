import 'package:flutter/material.dart';
import '../models/diabetes_calc.dart';

// Halaman Riwayat Pemeriksaan
class HistoryPage extends StatelessWidget {
  final List<RiwayatPemeriksaan> daftarRiwayat;
  final VoidCallback onHapusSemua;

  // Constructor
  const HistoryPage({
    super.key,
    required this.daftarRiwayat,
    required this.onHapusSemua,
  });

  @override
  Widget build(BuildContext context) {
    // SafeArea
    return SafeArea(
      // SingleChildScrollView
      child: SingleChildScrollView(
        // Padding
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // Column
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Banner
              // Container
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade400,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // Row
                child: Row(
                  children: [
                    // Icon
                    const Icon(
                      Icons.history,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    // SizedBox
                    const SizedBox(width: 12.0),
                    // Expanded
                    Expanded(
                      // Text
                      child: const Text(
                        'Riwayat Pemeriksaan',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    if (daftarRiwayat.isNotEmpty)
                      GestureDetector(
                        onTap: onHapusSemua,
                        // Container
                        child: Container(
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: Colors.red.shade400,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          // Icon
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // SizedBox
              const SizedBox(height: 16.0),

              if (daftarRiwayat.isEmpty)
              // Container
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  // Column
                  child: Column(
                    children: [
                      // Icon
                      Icon(
                        Icons.history_toggle_off,
                        size: 48.0,
                        color: Colors.grey.shade400,
                      ),
                      // SizedBox
                      const SizedBox(height: 12.0),
                      // Text
                      const Text(
                        'Belum Ada Riwayat',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // SizedBox
                      const SizedBox(height: 4.0),
                      // Text
                      const Text(
                        'Lakukan perhitungan di menu Kalkulator untuk menyimpan riwayat.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 13.0),
                      ),
                    ],
                  ),
                )
              else
              // Column
                Column(
                  children: List.generate(
                    daftarRiwayat.length,
                        (index) {
                      final item = daftarRiwayat[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        // Container
                        child: Container(
                          padding: const EdgeInsets.all(14.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.04),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          // Row
                          child: Row(
                            children: [
                              // Container
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Colors.lightBlue.shade100,
                                  shape: BoxShape.circle,
                                ),
                                // Icon
                                child: Icon(
                                  Icons.monitor_heart,
                                  color: Colors.lightBlue.shade800,
                                ),
                              ),
                              // SizedBox
                              const SizedBox(width: 12.0),
                              // Expanded
                              Expanded(
                                // Column
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text
                                    Text(
                                      item.nama,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    // SizedBox
                                    const SizedBox(height: 2.0),
                                    // Text
                                    Text(
                                      'Gula Darah: ${item.gulaDarah} mg/dL (${item.status})',
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.lightBlue.shade900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Text
                              Text(
                                item.waktu,
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
