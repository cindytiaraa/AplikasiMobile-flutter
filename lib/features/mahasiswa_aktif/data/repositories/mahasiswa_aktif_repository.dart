import 'package:dio/dio.dart';
import 'package:project/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {
  final Dio dio = Dio();

  Future<List<MahasiswaAktifModel>> getMahasiswaAktif() async {
    try {
      final response = await dio.get(
        'https://jsonplaceholder.typicode.com/users',
      );

      final List data = response.data;

      return data
          .map((json) => MahasiswaAktifModel.fromJson(json))
          .toList();

    } catch (e) {
      throw Exception('Gagal memuat data mahasiswa aktif: $e');
    }
  }
}