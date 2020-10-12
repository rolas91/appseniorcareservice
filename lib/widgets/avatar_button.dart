import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarButton extends StatelessWidget {
  final String url;
  final VoidCallback onPressed;
  final double imageSize;

  const AvatarButton({Key key, this.imageSize = 100, this.url, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    color: Colors.black26,
                    offset: Offset(0, 20)),
              ]),
          child: ClipOval(
            child: Image.network(
              this.url ?? 'https://www.w3schools.com/howto/img_avatar.png',
              width: this.imageSize,
              height: this.imageSize,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          right: 0,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Container(
              child: Icon(Icons.add, color: Colors.white),
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  color: Colors.redAccent,
                  shape: BoxShape.circle),
            ),
            borderRadius: BorderRadius.circular(30),
            onPressed: this.onPressed,
          ),
        ),
      ],
    );
  }
}
