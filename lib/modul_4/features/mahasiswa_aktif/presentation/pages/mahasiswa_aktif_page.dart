import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project/features/mahasiswa_aktif/presentation/providers/mahasiswa_aktif_provider.dart';
import 'package:project/features/mahasiswa_aktif/presentation/widgets/mahasiswa_aktif_widget.dart';

class MahasiswaAktifPage extends ConsumerWidget {

  const MahasiswaAktifPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final mahasiswaState =
        ref.watch(mahasiswaAktifNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mahasiswa Aktif"),
      ),

      // State: Loading
      body: mahasiswaState.when(
        loading: () =>
            const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text("Error: $error")),

        // State: memanggil data mahasiswa dari list dan memanggil widget
        data: (mahasiswaList) {
          return ListView.builder(
            itemCount: mahasiswaList.length,
            itemBuilder: (context, index) {
              return MahasiswaAktifCard(
                mahasiswa: mahasiswaList[index],                
                index: index,              
                );
            },
          );
        },
      ),
    );
  }
}