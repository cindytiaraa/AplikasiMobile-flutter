import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/common_widgets.dart';
import '../../../mahasiswa/presentation/providers/mahasiswa_provider.dart';
import '../../../mahasiswa/presentation/widgets/mahasiswa_widget.dart';

class MahasiswaPage extends ConsumerWidget {
  const MahasiswaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mahasiswaState = ref.watch(mahasiswaNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data mahasiswa'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              ref.invalidate(mahasiswaNotifierProvider);
            },
            tooltip: 'Refresh',
          )
        ],
      ),
      body: mahasiswaState.when(
        // State: Loading
        loading: () => const LoadingWidget(),
        error: (error, stack) => CustomErrorWidget(
          message: 'Gagal memuat data mahasiswa: ${error.toString()}',
          onRetry: () {
            ref.read(mahasiswaNotifierProvider.notifier).refresh();
          },
        ),

        // State: memanggil data mahasiswa dari list dan memanggil widget
        data: (mahasiswaList) {
          return ListView.builder(
            itemCount: mahasiswaList.length,
            itemBuilder: (context, index) {
              return MahasiswaCard(
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