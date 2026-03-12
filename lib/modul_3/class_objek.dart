import 'dart:io';

//CLASS
// class Mahasiswa {
//   String nama = 'Anang';

//   void tampilkanData() {
//     print(nama);
//   }
// }

// void main() {
//   var mahasiswa1 = Mahasiswa();
//   mahasiswa1.tampilkanData();

//   stdout.write('Masukkan nama baru: ');
//   String? namaBaru = stdin.readLineSync();
//   if (namaBaru != null && namaBaru.isNotEmpty) {
//     mahasiswa1.nama = namaBaru;
//     print('Nama berhasil diubah.');
//     mahasiswa1.tampilkanData();
//   } else {
//     print('Nama tidak boleh kosong.');
//   }
// }

//OBJECT
class Mahasiswa {
  String? nama;
  int? nim;
  String? jurusan;

  void tampilkanData() {
    print('Nama: ${nama?? 'Belum diisi'}');
    print('NIM: ${nim?? 'Belum diisi'}');
    print('Jurusan: ${jurusan?? 'Belum diisi'}');
  }
}

void main() {
  Mahasiswa mahasiswa = Mahasiswa();
  print('Masukkan nama mahasiswa : ');
  mahasiswa.nama = stdin.readLineSync();
  print('Masukkan NIM mahasiswa : ');
  mahasiswa.nim = int.tryParse(stdin.readLineSync() ?? '');
  print('Masukkan jurusan mahasiswa : ');
  mahasiswa.jurusan = stdin.readLineSync();
  mahasiswa.tampilkanData();
}