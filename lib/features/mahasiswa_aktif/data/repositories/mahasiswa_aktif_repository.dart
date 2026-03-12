import 'package:project/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {

  Future<List<MahasiswaAktifModel>> getMahasiswaAktif() async {

    await Future.delayed(const Duration(seconds: 1));

    return [
      MahasiswaAktifModel(
        nama: 'Cindy Tiara Anastasya',
        nim: '434241037',
        email: 'cindy.tiara@example.com',
        jurusan: 'Teknik Informatika'
      ),
      MahasiswaAktifModel(
        nama: 'Marsha Adhia',
        nim: '434241005',
        email: 'marsha.toji@example.com',
        jurusan: 'Teknik Informatika',
      ),
      MahasiswaAktifModel(
        nama: 'Wahid Akbar',
        nim: '434241000',
        email: 'wahid.akbar@example.com',
        jurusan: 'Teknik Informatika'
      ),
    ];
  }
}