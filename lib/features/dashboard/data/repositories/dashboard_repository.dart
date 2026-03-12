import '../models/dashboard_model.dart';

class DashboardRepository {
  // Mendapatkan data dashboard
  Future<DashboardData> getDashboardData() async {
    // network delay
    await Future.delayed(const Duration(seconds: 1));

    // Data dummy
    return DashboardData(
      userName: 'Admin D4TI',
      lastUpdated: DateTime.now(),
      stats: [
        DashboardStats(
          title: 'Total Mahasiswa',
          value: '1,234',
          subtitle: 'Mahasiswa terdaftar',
        ),
        DashboardStats(
          title: 'Mahasiswa Aktif',
          value: '1,180',
          subtitle: 'Sedang kuliah',
        ),
        DashboardStats(
          title: 'Dosen',
          value: '650',
          subtitle: 'Total dosen',
        ),
        DashboardStats(
          title: 'Mahasiswa Lulus',
          value: '892',
          subtitle: 'Telah lulus',
        ),
      ],
    );
  }

  // Refresh data dashboard
  Future<DashboardData> refreshDashboardData() async {
    return getDashboardData();
  }

  // Get spesific stat by title
  Future<DashboardStats?> getStatByTitle(String title) async {
    final data = await getDashboardData();
    try {
      return data.stats.firstWhere((stat) => stat.title == title);
    } catch (e) {
      return null; // Jika tidak ditemukan
    }
  }
}