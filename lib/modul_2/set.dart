import 'dart:io';

void main() {
  Set<String> burung = {'Merpati', 'Elang', 'Kakatua'};

  print('Data Burung: $burung');

  // Tambah data
  stdout.write('Masukkan burung yang ingin ditambahkan: ');
  String tambah = stdin.readLineSync()!;
  burung.add(tambah);
  print("Data setelah ditambah: $burung");

  // Hapus data
  stdout.write('Masukkan burung yang ingin dihapus: ');
  String hapus = stdin.readLineSync()!;
  if (burung.remove(hapus)) {
    print("Data '$hapus' berhasil dihapus.");
  } else {
    print("Data '$hapus' tidak ditemukan.");
  }

  // Cek data tertentu
  stdout.write('Masukkan burung yang ingin dicek: ');
  String cek = stdin.readLineSync()!;

  if (burung.contains(cek)) {
    print("Data '$cek' ADA di dalam Set.");
  } else {
    print("Data '$cek' TIDAK ADA di dalam Set.");
  }

  // Hitung jumlah data
  print('Total data sekarang: ${burung.length}');

  // Tampilkan semua data
  print('Data burung saat ini adalah: ');
  int no = 1;
  for (String b in burung) {
    print("$no. $b");
    no++;
  }
}