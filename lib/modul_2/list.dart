import 'dart:io';

void main() {
  List<String> names = ['Alfa', 'Beta', 'Charlie'];
  print('Names: $names');

  //Tambah data
  names.add('Delta');
  print('Names setelah ditambahkan: $names');

  //Index tertentu
  print('Names pertama: ${names[0]}');
  print('Names kedua: ${names[1]}');

  //Ubah index
  names[1]='Bravo';
  print('Names setelah diubah: $names');

  //Hapus data
  names.remove('Charlie');
  print('Names setelah dihapus: $names');

  //Hitung jumlah data
  print('Jumlah data: ${names.length}');

  //Tampilkan data dengan looping
  print('Menampilkan setiap elemen:');
  for (String name in names) {
    print(name);
  }

  //list kosong
  List<String> dataList= [];
  print('Data list kosong: $dataList');

  //mengambil data dari pengguna
  int count= 0;
  while(count <= 0) {
    stdout.write('Masukkan jumlah list:');
    String? input = stdin.readLineSync();
    try {
      count = int.parse(input!);
      if(count <= 0) {
        print('Masukkan angka lebih dari 0!');
      }
    } catch (e) {
      print ('Input tidak valid! Masukkan angka yang benar.');
    }
  }

  //memasukkan data ke dalam list menggunakan for loop
  for(int i = 0; i < count; i++) {
    stdout.write('data ke-${i+1}: ');
    String x = stdin.readLineSync()!;
    dataList.add(x);
  }

  //tampilkan dataList
  print('Data list:');
  print(dataList);

  stdout.write('Masukkan data ke berapa yang ingin ditampilkan: ');
  int index = int.parse(stdin.readLineSync()!);

  if (index >= 0 && index < dataList.length) {
    print('Data ke - $index: ${dataList[index -1]}');
  } else {
    print("Index tidak valid!");
  }

  // Ubah data
  stdout.write('Masukkan index yang ingin diubah: ');
  int indexUbah = int.parse(stdin.readLineSync()!);

  if (indexUbah >= 0 && indexUbah < dataList.length) {
    stdout.write('Masukkan data baru: ');
    String dataBaru = stdin.readLineSync()!;
    dataList[indexUbah] = dataBaru;
    print('Data berhasil diubah!');
  } else {
    print('Index tidak valid!');
  }

  // Hapus data
  stdout.write('Masukkan index yang ingin dihapus: ');
  int indexHapus = int.parse(stdin.readLineSync()!);

  if (indexHapus >= 0 && indexHapus < dataList.length) {
    dataList.removeAt(indexHapus);
    print('Data berhasil dihapus!');
  } else {
    print('Index tidak valid!');
  }

  // Hasil akhir
  print('Data akhir yang dihasilkan adalah: ');
  for (int i = 0; i < dataList.length; i++) {
    print("Index $i: ${dataList[i]}");
  }
}