import 'package:flutter/material.dart';

import '../commom/utils/custcolor.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double fontsize;
  final double width;
  final double radius;
  final String text;
  final Color backcolor;
  final VoidCallback? onPressed;
  const CustomButton(
      {Key? key,
      required this.text,
      this.fontsize = 14,
      this.height = 40,
      this.width = 100,
      this.radius = 15,
      this.backcolor = Coloors.button,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext) {
    return Container(
      width: width+10,
      height: height+10,
      child: TextButton(
          child: Text(text,
              style:
              TextStyle(fontSize: fontsize, color: Coloors.kertas)),
          style: ButtonStyle(
              padding:
                  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
              foregroundColor: MaterialStateProperty.all<Color>(Coloors.button),
              backgroundColor: MaterialStateProperty.all<Color>(Coloors.button),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: BorderSide(color: Coloors.button),
              ))),
          onPressed: onPressed),
    );
  }
}
