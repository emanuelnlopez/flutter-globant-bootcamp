import 'package:counter_test/src/domain/domain.dart';
import 'package:flutter/material.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({super.key, required this.repository});

  final AlbumRepository repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fetch Data Example')),
      body: Center(
        child: FutureBuilder<Album>(
          future: repository.fetchAlbum(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final album = snapshot.data!;
              return Text(
                album.title,
                style: Theme.of(context).textTheme.headlineSmall,
              );
            } else if (snapshot.hasError) {
              return Text(
                '${snapshot.error}',
                style: Theme.of(context).textTheme.headlineSmall,
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
