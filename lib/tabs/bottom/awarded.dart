import 'package:flutter/material.dart';

class Awarded extends StatelessWidget {
  const Awarded({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Awarded',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
