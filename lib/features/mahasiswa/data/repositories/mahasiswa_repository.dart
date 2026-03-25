import 'package:dio/dio.dart';
import 'package:project/features/mahasiswa/data/models/mahasiswa_model.dart';

class MahasiswaRepository {
  final Dio dio = Dio();

  Future<List<MahasiswaModel>> getMahasiswaList() async {
    try {
      final response = await dio.get(
        'https://jsonplaceholder.typicode.com/comments',
      );

      final List data = response.data;

      return data.map((json) => MahasiswaModel.fromJson(json)).toList();

    } catch (e) {
      throw Exception('Gagal memuat data mahasiswa: $e');
    }
  }
}