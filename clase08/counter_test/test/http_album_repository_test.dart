import 'package:counter_test/src/data/data.dart';
import 'package:counter_test/src/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'http_album_repository_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('fetchAlbum', () {
    test('returns an Album if the http call completes successfully', () async {
      final client = MockClient();
      final repository = HttpAlbumRepository(client: client);

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(
        client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')),
      ).thenAnswer(
        (_) async =>
            http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200),
      );

      final result = await repository.fetchAlbum();

      expect(result, isA<Album>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();
      final repository = HttpAlbumRepository(client: client);

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(
        client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')),
      ).thenAnswer((_) async => http.Response('Not Found', 404));

      final result = await repository.fetchAlbum();

      expect(result, throwsException);
    });
  });
}
