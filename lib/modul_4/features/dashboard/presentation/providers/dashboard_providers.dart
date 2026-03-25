import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/features/dashboard/data/repositories/dashboard_repository.dart';
import '../../data/models/dashboard_model.dart';

final DashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository();
});

// Menggunakan FutureProvider untuk async data 
final DashboardDataProvider = FutureProvider<DashboardData>((ref) async {
  final repository = ref.watch(DashboardRepositoryProvider);
  return repository.getDashboardData();
});

/// Notifier that loads dashboard data and supports refresh
class DashboardNotifier extends StateNotifier<AsyncValue<DashboardData>> {
  final DashboardRepository _repository;

  DashboardNotifier(this._repository) : super(const AsyncValue.loading()) {
    _loadDashboard();
  }

  /// Load data dashboard
  Future<void> _loadDashboard() async {
    try {
      final data = await _repository.getDashboardData();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Refresh dashboard
  Future<void> refresh() async {
  state = const AsyncValue.loading();

  try {
    final data = await _repository.getDashboardData();
    state = AsyncValue.data(data);
  } catch (e, st) {
    state = AsyncValue.error(e, st);
  }
}

  /// Update username
  void updateUserName(String newName) {
    state.whenData((data) {
      state = AsyncValue.data( data.copyWith(userName: newName) );
    }
    );
  }
}

/// Provider untuk DashboardNotifier
final dashboardNotifierProvider = 
  StateNotifierProvider<DashboardNotifier, AsyncValue<DashboardData>>((ref) {
    final repository = ref.watch(DashboardRepositoryProvider);
    return DashboardNotifier(repository);
  });

/// Provider untuk menyimpan index stat yang dipilih
final selectedStatIndexProvider = StateProvider<int>((ref) => 0);

/// Provider untuk stat yang dipilih 
final selectedStatProvider = StateProvider<int>((ref) => 0);

/// Provider untuk dark/light mode
final themeProvider = StateProvider<bool>(
  (ref) => false
); // false = light mode, true = dark mode