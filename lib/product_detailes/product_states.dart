import 'package:flutter/material.dart';

class Productstats extends StatelessWidget {
  final IconData icon;
  final String text;
  final String text2;
  final Color color;
  const Productstats({
    super.key,
    required this.icon,
    required this.text,
    required this.text2,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(24),
      ),
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Icon(icon, color: color),
          SizedBox(height: 6),
          Text(text, style: TextStyle(fontWeight: .bold, fontSize: 18)),
          Text(text2, style: TextStyle(fontWeight: .w300)),
        ],
      ),
    );
  }
}
