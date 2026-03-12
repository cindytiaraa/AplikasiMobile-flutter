import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';
import 'package:project/features/mahasiswa_aktif/data/repositories/mahasiswa_aktif_repository.dart';

final mahasiswaAktifRepositoryProvider =
    Provider<MahasiswaAktifRepository>((ref) {
  return MahasiswaAktifRepository();
});

class MahasiswaAktifNotifier
    extends StateNotifier<AsyncValue<List<MahasiswaAktifModel>>> {

  final MahasiswaAktifRepository repository;

  MahasiswaAktifNotifier(this.repository)
      : super(const AsyncValue.loading()) {
    loadMahasiswaAktif();
  }

  Future<void> loadMahasiswaAktif() async {
    try {
      final data = await repository.getMahasiswaAktif();
      state = AsyncValue.data(data);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> refresh() async {
    await loadMahasiswaAktif();
  }
}

final mahasiswaAktifNotifierProvider =
    StateNotifierProvider.autoDispose<
        MahasiswaAktifNotifier,
        AsyncValue<List<MahasiswaAktifModel>>>((ref) {

  final repository = ref.watch(mahasiswaAktifRepositoryProvider);
  return MahasiswaAktifNotifier(repository);
});