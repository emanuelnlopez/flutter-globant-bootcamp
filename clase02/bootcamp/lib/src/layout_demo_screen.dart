import 'package:bootcamp/src/widgets/button_section.dart';
import 'package:bootcamp/src/widgets/image_section.dart';
import 'package:bootcamp/src/widgets/text_section.dart';
import 'package:bootcamp/src/widgets/title_section.dart';
import 'package:flutter/material.dart';

class LayoutDemoScreen extends StatelessWidget {
  LayoutDemoScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}









// ImageSection(image: 'assets/images/lake.jpg'),
// TitleSection(
//   name: 'Oeschinen Lake Campground',
//   location: 'Kandersteg, Switzerland',
// ),
// ButtonSection(),
// TextSection(
//   description:
//       'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
// ),