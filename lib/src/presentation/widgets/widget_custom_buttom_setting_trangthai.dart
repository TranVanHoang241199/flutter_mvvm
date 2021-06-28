import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:get/get.dart';

class WidgetButtomTrangThai extends StatefulWidget {
  const WidgetButtomTrangThai({Key? key}) : super(key: key);

  @override
  _WidgetButtomTrangThaiState createState() => _WidgetButtomTrangThaiState();
}

class _WidgetButtomTrangThaiState extends State<WidgetButtomTrangThai> {
  late String nameLest = 'Reminders';

  late bool trangthai = true;
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
        _trangthai(),
      ]),
    );
  }

  Widget _trangthai() {
    return Container(
      margin: EdgeInsets.only(),
      height: Get.height * 0.04,
      width: Get.width * 0.16,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: trangthai == true ? Colors_Purple : Colors.grey),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            child: Container(
              height: Get.height * 0.035,
              width: Get.width * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: trangthai == true ? Colors_Purple : Colors.white,
              ),
            ),
            onTap: () {
              setState(() {
                trangthai = false;
              });
            },
          ),
          GestureDetector(
            child: Container(
              height: Get.height * 0.035,
              width: Get.width * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: trangthai == true ? Colors.white : Colors.grey,
              ),
            ),
            onTap: () {
              setState(() {
                trangthai = true;
              });
            },
          )
        ],
      ),
    );
  }
}
