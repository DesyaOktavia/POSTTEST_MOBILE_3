// Class Logika Kalkulator Diabetes (Modul 1: Pengenalan Dart)
class DiabetesCalc {
  // Variabel Property = Null Safety
  double? gulaDarah;
  String? namaPasien;
  int? usia;

  // Constructor
  DiabetesCalc({
    this.gulaDarah,
    this.namaPasien,
    this.usia,
  });

  // Method Positional Parameter & Named Parameter
  String cekStatus(double nilai, {String satuan = 'mg/dL'}) {
    if (nilai < 70) {
      return 'Hipoglikemia (Rendah)';
    } else if (nilai <= 100) {
      return 'Normal';
    } else if (nilai <= 125) {
      return 'Pra-Diabetes';
    } else {
      return 'Diabetes Melitus';
    }
  }

  // Map
  static final Map<String, String> infoKategoriMap = {
    'Hipoglikemia (Rendah)':
    'Kadar gula darah di bawah normal (<70 mg/dL). Perlu konsumsi makanan/minuman manis penambah gula secara bertahap.',
    'Normal':
    'Kadar gula darah dalam batas aman (70 - 100 mg/dL). Pertahankan pola makan sehat dan gaya hidup aktif Anda.',
    'Pra-Diabetes':
    'Kadar gula darah agak tinggi (101 - 125 mg/dL). Berisiko menjadi diabetes melitus jika tidak menjaga pola hidup.',
    'Diabetes Melitus':
    'Kadar gula darah tinggi (>=126 mg/dL). Disarankan melakukan pemeriksaan lebih lanjut dan konsultasi ke dokter.',
  };

  // List
  static final List<String> tipsKesehatanList = [
    'Jaga pola makan, tidak mengonsumsi gula secara berlebihan.',
    'Minum air putih sehari 1,8 - 2,1 Liter.',
    'Olahraga secara teratur dan jaga pola tidur yang cukup.',
    'Hindari stres berlebihan dan lakukan cek kesehatan berkala.',
  ];

  // Set
  static final Set<String> daftarKategoriSet = {
    'Hipoglikemia (Rendah)',
    'Normal',
    'Pra-Diabetes',
    'Diabetes Melitus',
  };
}

// Class Simpan Riwayat Pemeriksaan
class RiwayatPemeriksaan {
  final String nama;
  final double gulaDarah;
  final String status;
  final String waktu;

  // Constructor
  RiwayatPemeriksaan({
    required this.nama,
    required this.gulaDarah,
    required this.status,
    required this.waktu,
  });
}
