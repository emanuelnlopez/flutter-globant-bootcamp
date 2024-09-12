import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class FavoriteWidget extends StatefulWidget {
  FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  final logger = Logger('FavoriteWidget');
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    logger.finest('''--------------------------
    FavoriteWidget: building...
--------------------------''');
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          alignment: Alignment.center,
          icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
          color: Colors.red[500],
          onPressed: _toggleFavorite,
        ),
        SizedBox(
          width: 18.0,
          child: Text('$_favoriteCount'),
        ),
      ],
    );
  }
}
