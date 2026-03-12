import 'dart:io';

class Mahasiswa {
  String? nama;
  int? nim;
  String? jurusan;

  void tampilkanData() {
    print("Nama: ${nama ?? 'Belum diisi'}");
    print("NIM: ${nim ?? 'Belum diisi'}");
    print("Jurusan: ${jurusan ?? 'Belum diisi'}");
  }
}

  // EXTENDS
  class MahasiswaAktif extends Mahasiswa {
    int? semester;

    void status() {
      print("Status: Mahasiswa Aktif");
      print("Semester: ${semester ?? 'Belum diisi'}");
    }
  }

  class MahasiswaAlumni extends Mahasiswa {
    int? tahunLulus;

    void status() {
      print("Status: Alumni");
      print("Tahun Lulus: ${tahunLulus ?? 'Belum diisi'}");
    }
  }

void main() {
  print("Pilih Jenis Mahasiswa:");
  print("1. Mahasiswa Aktif");
  print("2. Alumni");
  stdout.write("Masukkan pilihan (1/2): ");
  String pilihan = stdin.readLineSync()!;

  if (pilihan == "1") {
    var mhs = MahasiswaAktif();

    stdout.write("Masukkan nama: ");
    mhs.nama = stdin.readLineSync();

    stdout.write("Masukkan NIM: ");
    mhs.nim = int.parse(stdin.readLineSync()!);

    stdout.write("Masukkan jurusan: ");
    mhs.jurusan = stdin.readLineSync();

    stdout.write("Masukkan semester: ");
    mhs.semester = int.parse(stdin.readLineSync()!);

    print("\n=== DATA MAHASISWA AKTIF ===");
    mhs.tampilkanData();
    mhs.status();

  } else if (pilihan == "2") {
    var mhs = MahasiswaAlumni();

    stdout.write("Masukkan nama: ");
    mhs.nama = stdin.readLineSync();

    stdout.write("Masukkan NIM: ");
    mhs.nim = int.parse(stdin.readLineSync()!);

    stdout.write("Masukkan jurusan: ");
    mhs.jurusan = stdin.readLineSync();

    stdout.write("Masukkan tahun lulus: ");
    mhs.tahunLulus = int.parse(stdin.readLineSync()!);

    print("\n=== DATA MAHASISWA ALUMNI ===");
    mhs.tampilkanData();
    mhs.status();

  } else {
    print("Pilihan tidak valid.");
  }
}