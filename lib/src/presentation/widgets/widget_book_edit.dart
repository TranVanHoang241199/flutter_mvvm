import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:get/get.dart';

class WidgetBookEdit extends StatefulWidget {
  final Color primaryColor;
  final String title;
  const WidgetBookEdit(
      {Key? key, required this.primaryColor, required this.title})
      : super(key: key);

  @override
  _WidgetBookEditState createState() => _WidgetBookEditState();
}

class _WidgetBookEditState extends State<WidgetBookEdit> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: Get.width * 0.07,
                height: Get.height * 0.19,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    Image.asset(AppImages.thanhNganBaCham),
                  ],
                ),
              ),
              SizedBox(
                width: Get.width * 0.045,
              ),
              Image.asset(
                AppImages.thanhDungBook,
                fit: BoxFit.fitHeight,
                height: Get.height * 0.19,
              ),
            ],
          ),
        ),
        SizedBox(
          height: Get.height * 0.01,
        ),
        Text(
          widget.title,
        ),
      ],
    );
  }
}

// class WidgetBookEdit extends StatelessWidget {
//   const WidgetBookEdit({Key? key, required this.primaryColor, this.title})
//       : super(key: key);
  

  
// }
