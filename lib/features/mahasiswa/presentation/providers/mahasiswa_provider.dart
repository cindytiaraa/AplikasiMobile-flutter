import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/core/services/local_storage_service.dart';
import 'package:project/features/mahasiswa/data/models/mahasiswa_model.dart';
import 'package:project/features/mahasiswa/data/repositories/mahasiswa_repository.dart';

final mahasiswaRepositoryProvider =
    Provider<MahasiswaRepository>((ref) {
  return MahasiswaRepository();
});

final localStorageServiceProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService();
});

final savedUsersProvider = FutureProvider<List<Map<String, String>>>((ref) async {
  final storage = ref.watch(localStorageServiceProvider);
  return storage.getSavedUsers();
});

class MahasiswaNotifier
    extends StateNotifier<AsyncValue<List<MahasiswaModel>>> {

  final MahasiswaRepository repository;
  final LocalStorageService _storage;

  MahasiswaNotifier(this.repository, this._storage)
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

  Future<void> saveSelectedMahasiswa(MahasiswaModel mahasiswa) async {
    await _storage.addUserToSavedList(
      userId: mahasiswa.id.toString(),
      username: mahasiswa.name,
    );
  }

  Future<void> removeSavedMahasiswa(String userId) async {
    await _storage.removeSavedUser(userId);
  }

  Future<void> clearSavedMahasiswa() async {
    await _storage.clearSavedUsers();
  }
}

final mahasiswaNotifierProvider =
    StateNotifierProvider.autoDispose<
        MahasiswaNotifier,
        AsyncValue<List<MahasiswaModel>>>((ref) {

  final repository = ref.watch(mahasiswaRepositoryProvider);
  final storage = ref.watch(localStorageServiceProvider);
  return MahasiswaNotifier(repository, storage);
});