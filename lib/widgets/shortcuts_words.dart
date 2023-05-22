import 'package:flutter/material.dart';

class UnderPart extends StatelessWidget {
  const UnderPart(
      {Key? key,
        required this.navigatorText,
        required this.title,
        this.size = 15,
        required this.onTap,
        this.fontWeight1 = FontWeight.w400,
        this.fontWeight2 = FontWeight.w600,
        this.textDecoration = TextDecoration.underline,
        this.boxSize = 10})
      : super(key: key);
  final String title;
  final String navigatorText;
  final Function() onTap;
  final double size;
  final FontWeight fontWeight1;
  final FontWeight fontWeight2;
  final TextDecoration textDecoration;
  final double boxSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: size,
            color: Colors.grey,
            fontWeight: fontWeight1,
          ),
        ),
        SizedBox(
          width: boxSize,
        ),
        InkWell(
          onTap: () {
            onTap();
          },
          child: Text(
            navigatorText,
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: size,
              fontWeight: fontWeight2,
              decoration: textDecoration,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ],
    );
  }
}