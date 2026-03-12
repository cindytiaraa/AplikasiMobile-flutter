import '../../../dosen/data/models/dosen_model.dart';

class DosenRepository {
  // Mendapatkan daftar dosen
  Future<List<DosenModel>> getDosenList() async {
  // Simulasi network delay
  await Future.delayed(const Duration(seconds: 1));

  // Data dummy dosen
  return [
    DosenModel(
      nama: 'Anank Prasetyo',
      nip: '123456789',
      email: 'anank.prasetyo@example.com',
      jurusan: 'Teknik Informatika'
    ),
    DosenModel(
      nama: 'Rachman Sinatriya',
      nip: '987654321',
      email: 'rachman.sinatriya@example.com',
      jurusan: 'Teknik Informatika'
    ),
    DosenModel(
      nama: 'Alifian Sukma',
      nip: '456789123',
      email: 'alifian.sukma@example.com',
      jurusan: 'Teknik Informatika'
    ),
  ];
  }
}