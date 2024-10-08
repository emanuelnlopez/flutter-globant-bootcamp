import 'package:bootcamp/src/widgets/favorite_widget.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class TitleSection extends StatelessWidget {
  TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final logger = Logger('TitleSection');
  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    logger.finest('''--------------------------
    TitleSection: building...
--------------------------''');
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                location,
                style: TextStyle(color: Colors.grey[500]),
              ),
            ],
          ),
          FavoriteWidget(),
        ],
      ),
    );
  }
}
