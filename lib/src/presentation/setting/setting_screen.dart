import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/Setting/setting.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/widgets/widget_custom_buttom_Setting.dart';
import 'package:flutter_app/src/presentation/widgets/widget_custom_buttom_setting_trangthai.dart';
import 'package:get/get.dart';
import '../presentation.dart';
import 'dialog_setting/dialog_create_setting.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> with ResponsiveWidget {
  late SettingViewModel _viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<SettingViewModel>(
        viewModel: SettingViewModel(),
        onViewModelReady: (viewModel) {
          _viewModel = viewModel!..init();
        },
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Colors.grey[200],
            body: buildUi(context: context),
          );
        });
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return SizedBox();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return buildBody(context);
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildBody(context);
  }

  Widget buildBody(BuildContext context) {
    return NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.grey[200],
              floating: true,
              expandedHeight: Get.height * 0.146,
              forceElevated: innerBoxIsScrolled,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: _appBar(),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              _bodyListTop(),
              _bodyListbotton(),
              _button(),
            ],
          ),
        ));
  }

  _appBar() {
    return Container(
      height: Get.height * 0.145,
      width: Get.width,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Container(
            height: Get.height * 0.08,
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors_Purple,
                    size: 32,
                  ),
                  onTap: () => _viewModel.goToBackHomeScreen(),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 38,
                  ),
                  onTap: () => Get.dialog(DialogSetting()),
                )
              ],
            ),
          ),
          Container(
            height: Get.height * 0.065,
            width: Get.width,
            child: Align(
                alignment: Alignment.centerLeft * 0.94,
                child: Text(
                  'Settings',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                )),
          )
        ],
      ),
    );
  }

  Widget _bodyListTop() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 27),
      height: Get.height * 0.3875,
      width: Get.width,
      child: Column(
        children: [
          Container(
            height: Get.height * 0.06,
            width: Get.width,
            alignment: Alignment.centerLeft,
            child: Text(
              'Note List Sorting',
              style: TextStyle(fontSize: 16.5),
            ),
          ),
          Container(
            height: Get.height * 0.3275,
            width: Get.width,
            child: Column(
              children: [
                WidgetButtomText(
                  nameLest: 'Language',
                  nameright: 'english',
                ),
                WidgetButtomText(
                  nameLest: 'Line Width',
                  nameright: '2.3',
                ),
                WidgetButtomTrangThai(
                    // nameLest: 'Reminders',
                    ),
                WidgetButtomText(
                  nameLest: 'Line Width',
                  nameright: '2.3',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _bodyListbotton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 27),
      height: Get.height * 0.3875,
      width: Get.width,
      child: Column(
        children: [
          Container(
            height: Get.height * 0.06,
            width: Get.width,
            alignment: Alignment.centerLeft,
            child: Text(
              'Note List Sorting',
              style: TextStyle(fontSize: 16.5),
            ),
          ),
          Container(
            height: Get.height * 0.3275,
            width: Get.width,
            child: Column(
              children: [
                WidgetButtomText(
                  nameLest: 'Language',
                  nameright: 'english',
                ),
                WidgetButtomText(
                  nameLest: 'Line Width',
                  nameright: '2.3',
                ),
                WidgetButtomTrangThai(
                    // nameLest: 'Reminders',
                    ),
                WidgetButtomText(
                  nameLest: 'Line Width',
                  nameright: '2.3',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _button() {
    return Container(
      margin: EdgeInsets.only(top: 7, bottom: 60),
      height: Get.height * 0.066,
      width: Get.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27),
        color: Colors.blue,
      ),
      child: Center(
          child: Text(
        'Subscribe\n now', textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
        ), //wordSpacing: 5
      )),
    );
  }
}
