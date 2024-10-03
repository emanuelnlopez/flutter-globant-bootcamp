import 'dart:convert';

import 'package:counter_test/src/domain/domain.dart';
import 'package:http/http.dart';

class HttpAlbumRepository implements AlbumRepository {
  HttpAlbumRepository({required this.client});

  final Client client;

  @override
  Future<Album> fetchAlbum() async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
    );

    if (response.statusCode == 200) {
      return Album.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
