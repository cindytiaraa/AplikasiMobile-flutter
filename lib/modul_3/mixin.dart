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
    // MIXIN
    mixin Presensi {
      void absen() {
        print("Melakukan presensi.");
      }
    }

    mixin Akademik {
      void kelolaNilai() {
        print("Mengelola nilai akademik.");
      }
    }

    mixin Administrasi {
      void kelolaArsip() {
        print("Mengelola administrasi.");
      }
    }

  // EXTENDS
  class Dosen extends Mahasiswa
      with Presensi, Akademik {

    void info() {
      print("Status: Dosen");
    }
  }

  class Fakultas extends Mahasiswa
      with Administrasi {

    void info() {
      print("Status: Fakultas");
    }
  }

void main() {
  print("Pilih Role:");
  print("1. Dosen");
  print("2. Fakultas");
  stdout.write("Masukkan pilihan (1/2): ");
  String pilihan = stdin.readLineSync()!;

  if (pilihan == "1") {
    var dosen = Dosen();

    stdout.write("Masukkan nama: ");
    dosen.nama = stdin.readLineSync();

    stdout.write("Masukkan NIP: ");
    dosen.nim = int.parse(stdin.readLineSync()!);

    stdout.write("Masukkan jurusan: ");
    dosen.jurusan = stdin.readLineSync();

    print("\n=== DATA DOSEN ===");
    dosen.tampilkanData();
    dosen.info();
    dosen.absen();
    dosen.kelolaNilai();

  } else if (pilihan == "2") {
    var fakultas = Fakultas();

    stdout.write("Masukkan nama: ");
    fakultas.nama = stdin.readLineSync();

    stdout.write("Masukkan NIP: ");
    fakultas.nim = int.parse(stdin.readLineSync()!);

    stdout.write("Masukkan jurusan: ");
    fakultas.jurusan = stdin.readLineSync();

    print("\n=== DATA FAKULTAS ===");
    fakultas.tampilkanData();
    fakultas.info();
    fakultas.kelolaArsip();

  } else {
    print("Pilihan tidak valid.");
  }
}