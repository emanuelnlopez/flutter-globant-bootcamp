import 'package:counter_test/src/domain/domain.dart';

abstract class AlbumRepository {
  Future<Album> fetchAlbum();
}
