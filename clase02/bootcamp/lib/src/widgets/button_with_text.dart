import 'package:flutter/widgets.dart';

class ButtonWithText extends StatelessWidget {
  ButtonWithText({
    required this.color,
    required this.icon,
    super.key,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
