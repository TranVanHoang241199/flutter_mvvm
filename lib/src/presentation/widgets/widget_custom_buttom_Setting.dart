import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetButtomText extends StatelessWidget {
  final String nameLest;
  final String nameright;
  const WidgetButtomText({
    Key? key,
    required this.nameLest,
    required this.nameright,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.0685,
      width: Get.width,
      margin: EdgeInsets.only(
        bottom: 11,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7), color: Colors.white),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(nameLest),
        Row(
          children: [
            Text(
              nameright,
              style: TextStyle(color: Colors.grey),
            ),
            Icon(
              Icons.navigate_next,
              color: Colors.blue,
              size: 25,
            )
          ],
        )
      ]),
    );
  }
}
