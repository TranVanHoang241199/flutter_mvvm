import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:get/get.dart';

class WidgetBook extends StatelessWidget {
  const WidgetBook({Key? key, required this.primaryColor, required this.title})
      : super(key: key);
  final Color primaryColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: primaryColor,
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
                      ),
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
          title,
        ),
      ],
    );
  }
}
