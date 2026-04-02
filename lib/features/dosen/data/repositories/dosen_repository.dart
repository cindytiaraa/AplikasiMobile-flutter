import 'package:project/core/network/dio_client.dart';
import 'package:project/features/dosen/data/models/dosen_model.dart';
import 'package:dio/dio.dart';

class DosenRepository {
  final DioClient dioClient;

  DosenRepository({DioClient? dioClient})
      : dioClient = dioClient ?? DioClient();

  // get dosen list
  Future<List<DosenModel>> getDosenList() async {
    try {
      final Response response = await dioClient.dio.get('/users');
      final List<dynamic> data = response.data;
      return data.map((json) => DosenModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception(
        'Gagal memuat data dosen: ${e.message}',
      );
    }
  }
}