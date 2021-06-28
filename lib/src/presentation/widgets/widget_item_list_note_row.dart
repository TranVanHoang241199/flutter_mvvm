import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:get/get.dart';

class WidgetNoteListRow extends StatelessWidget {
  final double height;
  final String nameTile;
  final String namedata;
  final String dateTile;
  const WidgetNoteListRow({
    Key? key,
    required this.height,
    required this.nameTile,
    required this.namedata,
    required this.dateTile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: Get.width,
        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7), color: Colors.grey[200]),
          child: Column(
            children: [
              _nuttop(),
              _nutBotton(),
            ],
          ),
        ));
  }

  Widget _createNutLeft() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors_Purple,
        ),
      ),
    );
  }

  Widget _nuttop() {
    return Container(
      height: Get.height * 0.05,
      width: Get.height * 0.37,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  nameTile,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            Text(
              dateTile,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _nutBotton() {
    return Container(
      height: Get.height * 0.065,
      width: Get.height * 0.37,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          namedata,
          style: TextStyle(
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
