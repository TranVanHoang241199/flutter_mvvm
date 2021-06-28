import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:get/get.dart';

class WidgetNoteListRowHai extends StatefulWidget {
  final double height;
  final String nameTile;
  final String namedata;
  final String dateTile;

  const WidgetNoteListRowHai({
    Key? key,
    required this.height,
    required this.nameTile,
    required this.namedata,
    required this.dateTile,
  }) : super(key: key);

  @override
  _WidgetNoteListRowHaiState createState() => _WidgetNoteListRowHaiState();
}

class _WidgetNoteListRowHaiState extends State<WidgetNoteListRowHai> {
  late bool TrangThai = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: Get.height * 0.12,
          width: Get.width * 0.12,
          margin: EdgeInsets.only(
            bottom: 10,
          ),
          child: TrangThai == true ? _createNutLeft() : _createNutLeftHai(),
        ),
        Container(
          height: widget.height,
          width: Get.width * 0.8,
          margin: EdgeInsets.only(bottom: 10, right: 10),
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.grey[200]),
            child: Column(
              children: [
                _nuttop(),
                _nutBotton(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _createNutLeft() {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        child: Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors_Purple,
          ),
        ),
        onTap: () {
          setState(() {
            TrangThai = false;
          });
        },
      ),
    );
  }

  Widget _createNutLeftHai() {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        child: Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
        ),
        // onTap: () {
        //   setState(() {
        //     TrangThai = true;
        //   });
        // },
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
                  widget.nameTile,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            Text(
              widget.dateTile,
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
          widget.namedata,
          style: TextStyle(
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
