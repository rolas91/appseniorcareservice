import 'package:flutter/material.dart';

class Open extends StatelessWidget {
  const Open({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Open',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
