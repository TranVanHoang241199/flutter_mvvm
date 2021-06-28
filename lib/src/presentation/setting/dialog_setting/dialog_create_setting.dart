import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:get/get.dart';

class DialogSetting extends StatefulWidget {
  const DialogSetting({Key? key}) : super(key: key);

  @override
  _DialogSettingState createState() => _DialogSettingState();
}

class _DialogSettingState extends State<DialogSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.topCenter * 0.4,
        child: Container(
          height: Get.height * 0.45,
          width: Get.width * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.025,
              ),
              Icon(
                Icons.add_reaction_outlined,
                color: Colors_Purple.withOpacity(0.75),
                size: 100,
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Text(
                'Help us please :)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('We would be very happy if you',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  Text('help us by rating on the',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  Text('Appstore or providing us',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  Text('feedbacks.',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Container(
                height: Get.height * 0.057,
                width: Get.width * 0.46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors_Purple.withOpacity(0.9),
                ),
                child: Center(
                  child: Text('Rate Us',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white)),
                ),
              ),
              SizedBox(
                height: Get.height * 0.010,
              ),
              Container(
                height: Get.height * 0.057,
                width: Get.width * 0.46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors_Purple.withOpacity(0.9),
                ),
                child: Center(
                  child: Text('Give Feedback',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
