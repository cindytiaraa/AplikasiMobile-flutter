import 'dart:convert';
import 'package:project/features/dosen/data/models/dosen_model.dart';
// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class DosenRepository {

  /// METHOD HTTP
  // Future<List<DosenModel>> getDosenList() async {
  //   final response = await http.get(
  //     Uri.parse('https://jsonplaceholder.typicode.com/users'),
  //     headers: {'Accept': 'application/json'},
  //   );

  //   if (response.statusCode == 200) {
  //     final List<dynamic> data = jsonDecode(response.body);
  //     print("HTTP DATA: $data");

  //     return data.map((json) => DosenModel.fromJson(json)).toList();
  //   } else {
  //     throw Exception('Gagal memuat data dosen: ${response.statusCode}');
  //   }
  // }

  /// METHOD DIO
  final Dio dio = Dio();

  Future<List<DosenModel>> getDosenListDio() async {
    try {
      final response = await dio.get(
        'https://jsonplaceholder.typicode.com/users',
      );

      final List data = response.data;
      print("DIO DATA: $data");

      return data.map((json) => DosenModel.fromJson(json)).toList();

    } catch (e) {
      throw Exception('Gagal memuat data dosen: $e');
    }
  }

  /// Legacy method name used by provider.
  Future<List<DosenModel>> getDosenList() => getDosenListDio();
}