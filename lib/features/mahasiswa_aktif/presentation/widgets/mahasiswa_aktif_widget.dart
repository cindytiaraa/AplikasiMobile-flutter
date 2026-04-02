import 'package:flutter/material.dart';
import 'package:project/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';

class MahasiswaAktifCard extends StatelessWidget {

  final MahasiswaAktifModel mahasiswa;
  final List<Color>? gradientColors;
  final int index;

  const MahasiswaAktifCard({
    super.key,
    required this.mahasiswa,
    this.gradientColors,
    this.index = 0,
  });

  List<Color> _getDefaultGradient() {
    final colors = [
      [const Color(0xFF7B68EE), const Color(0xFF8B7FD8)],
      [const Color(0xFFFF69B4), const Color(0xFFFF85D0)],
      [const Color(0xFF00BCD4), const Color(0xFF26E5FF)],
      [const Color(0xFF4CAF50), const Color(0xFF66BB6A)],
    ];
    return colors[index % colors.length].cast<Color>();
  }

  @override
  Widget build(BuildContext context) {
    final colors = gradientColors ?? _getDefaultGradient();
    
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      elevation: 6,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                mahasiswa.nama.isNotEmpty
                    ? mahasiswa.nama.substring(0, 1).toUpperCase()
                    : '?',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          title: Text(
            mahasiswa.nama,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NIM: ${mahasiswa.nim}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                mahasiswa.email,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Jurusan: ${mahasiswa.jurusan}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}