import 'package:flutter/material.dart';
import '../commom/utils/custcolor.dart';
import "package:flutter_svg/flutter_svg.dart";

class PickMood extends StatelessWidget {
  final String assetName;
  final String textdrink;
  final String textmood;
  final String textprice;
  final VoidCallback? ontap;
  final bool isActive;
  PickMood(
      {Key? key,
      required this.assetName,
      required this.textdrink,
      required this.textmood,
      required this.textprice,
      this.ontap,
      this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10) ,
          border: Border.all(
            color: isActive ? Coloors.kertas : Colors.transparent, // Border aktif atau tidak
            width: 1,
          ),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            SvgPicture.asset(
              assetName,
              height: 45,
              width: 55.93,
            ),
            SizedBox(width: 20),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textdrink,
                    style: TextStyle(
                        color: Coloors.kertas,
                        fontFamily: 'Norquay',
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 5),
                  Text(
                    textmood,
                    style: TextStyle(
                        color: Coloors.kertas,
                        fontFamily: 'Nunito',
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Spacer(),
            SizedBox(
                child: Text(
              textprice,
              style: TextStyle(
                  color: Coloors.kertas,
                  fontFamily: 'Nunito',
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ))
          ],
        ),
      ),
    );
  }
}
