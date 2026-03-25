import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/features/mahasiswa/data/models/mahasiswa_model.dart';
import 'package:project/features/mahasiswa/data/repositories/mahasiswa_repository.dart';

final mahasiswaRepositoryProvider =
    Provider<MahasiswaRepository>((ref) {
  return MahasiswaRepository();
});

class MahasiswaNotifier
    extends StateNotifier<AsyncValue<List<MahasiswaModel>>> {

  final MahasiswaRepository repository;

  MahasiswaNotifier(this.repository)
      : super(const AsyncValue.loading()) {
    loadMahasiswa();
  }

  Future<void> loadMahasiswa() async {
    try {
      final data = await repository.getMahasiswaList();
      state = AsyncValue.data(data);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> refresh() async {
    await loadMahasiswa();
  }
}

final mahasiswaNotifierProvider =
    StateNotifierProvider.autoDispose<
        MahasiswaNotifier,
        AsyncValue<List<MahasiswaModel>>>((ref) {

  final repository = ref.watch(mahasiswaRepositoryProvider);
  return MahasiswaNotifier(repository);
});