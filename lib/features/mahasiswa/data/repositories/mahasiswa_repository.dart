import '../../../mahasiswa/data/models/mahasiswa_model.dart';

class MahasiswaRepository {
  // Mendapatkan daftar Mahasiswa
  Future<List<MahasiswaModel>> getMahasiswaList() async {
  // Simulasi network delay
  await Future.delayed(const Duration(seconds: 1));

  // Data dummy Mahasiswa
  return [
    MahasiswaModel(
      nama: 'Cindy Tiara Anastasya',
      nim: '434241037',
      email: 'cindy.tiara@example.com',
      jurusan: 'Teknik Informatika'
    ),
    MahasiswaModel(
      nama: 'Marsha Adhia',
      nim: '434241005',
      email: 'marsha.toji@example.com',
      jurusan: 'Teknik Informatika'
    ),
    MahasiswaModel(
      nama: 'Wahid Akbar',
      nim: '434241000',
      email: 'wahid.akbar@example.com',
      jurusan: 'Teknik Informatika'
    ),
  ];
  }
}