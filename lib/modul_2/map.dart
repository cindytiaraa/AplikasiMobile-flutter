import 'dart:io';

void main() {
  //membuat map dengan data awal
  Map<String, String> data = {
    'Anang' : '081234567890',
    'Arman' : '082345678901',
    'Doni'  : '083456789012',
  };
  print('Data: $data');

  //menambahkan data ke map
  data['Rio']= '08456789123';
  print('Data setelah ditambahkan: $data');

  // Tampilkan berdasarkan key
  stdout.write('Masukkan nama yang ingin ditampilkan: ');
  String namaCari = stdin.readLineSync()!;
  if (data.containsKey(namaCari)) {
    print('Nomor $namaCari: ${data[namaCari]}');
  } else {
    print('Data tidak ditemukan.');
  }

  // Ubah data
  stdout.write('Masukkan nama yang ingin diubah: ');
  String namaUbah = stdin.readLineSync()!;
  if (data.containsKey(namaUbah)) {
    stdout.write('Masukkan nomor baru: ');
    String nomorBaru = stdin.readLineSync()!;
    data[namaUbah] = nomorBaru;
    print('Data berhasil diubah.');
  } else {
    print('Data tidak ditemukan.');
  }

  // Hapus data
  stdout.write('Masukkan nama yang ingin dihapus: ');
  String namaHapus = stdin.readLineSync()!;
  if (data.remove(namaHapus) != null) {
    print('Data berhasil dihapus.');
  } else {
    print('Data tidak ditemukan.');
  }

  // Cek data berdasarkan key
  stdout.write('Masukkan nama yang ingin dicek: ');
  String namaCek = stdin.readLineSync()!;
  if (data.containsKey(namaCek)) {
    print('Data $namaCek ADA dalam Map.');
  } else {
    print('Data $namaCek TIDAK ADA dalam Map.');
  }

  // Hitung jumlah data
  print('Total data sekarang: ${data.length}');

  // Tampilkan semua key
  print('Semua key yang tersimpan saat ini: ');
  data.keys.forEach((key) {
    print(key);
  });

  // Tampilkan semua value
  print('Semua value yang tersimpan saat ini: ');
  data.values.forEach((value) {
    print(value);
  });

  // Tampilkan semua data
  print('Semua data yang tersimpan saat ini: ');
  data.forEach((key, value) {
    print("$key : $value");
  });

  //SINGLE AND MULTIPLE

  print('=== INPUT DATA MAHASISWA ===');

  stdout.write('Masukkan NIM: ');
  String nim = stdin.readLineSync()!;

  stdout.write('Masukkan Nama: ');
  String nama = stdin.readLineSync()!;

  stdout.write('Masukkan Jurusan: ');
  String jurusan = stdin.readLineSync()!;

  stdout.write('Masukkan IPK: ');
  double ipk = double.parse(stdin.readLineSync()!);

  Map<String, dynamic> mahasiswa = {
    'nim': nim,
    'nama': nama,
    'jurusan': jurusan,
    'ipk': ipk
  };

  print('Data Mahasiswa: $mahasiswa');


  // INPUT MULTIPLE MAHASISWA
  print('=== INPUT MULTIPLE MAHASISWA ===');

  stdout.write('Masukkan jumlah mahasiswa: ');
  int jumlah = int.parse(stdin.readLineSync()!);

  List<Map<String, dynamic>> daftarMahasiswa = [];

  for (int i = 0; i < jumlah; i++) {
    print(' --- Mahasiswa ke-${i + 1} --- ');

    stdout.write('Masukkan NIM: ');
    String nimM = stdin.readLineSync()!;

    stdout.write('Masukkan Nama: ');
    String namaM = stdin.readLineSync()!;

    stdout.write('Masukkan Jurusan: ');
    String jurusanM = stdin.readLineSync()!;

    stdout.write('Masukkan IPK: ');
    double ipkM = double.parse(stdin.readLineSync()!);

    Map<String, dynamic> mhs = {
      'nim': nimM,
      'nama': namaM,
      'jurusan': jurusanM,
      'ipk': ipkM
    };

    daftarMahasiswa.add(mhs);
  }

  print(' === DATA SEMUA MAHASISWA === ');
  for (var mhs in daftarMahasiswa) {
    print(mhs);
  }
}