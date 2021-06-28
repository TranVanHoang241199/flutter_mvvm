import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:get/get.dart';

import '../presentation.dart';
import 'content.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({Key? key}) : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> with ResponsiveWidget {
  late ContentViewModel _viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ContentViewModel>(
        viewModel: ContentViewModel(),
        onViewModelReady: (viewModel) {
          _viewModel = viewModel!..init();
        },
        builder: (context, viewModel, child) {
          return Scaffold(
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
              floating: true,
              expandedHeight: Get.height * 0.15,
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
          child: Expanded(
            child: _body(),
          ),
        ));
  }

  _appBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: Get.height * 0.15,
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
                    size: 30,
                  ),
                  onTap: () => _viewModel.goToBackHomeScreen(),
                ),
                SizedBox(
                  height: Get.height * 0.06,
                ),
                Icon(
                  Icons.ios_share,
                  size: 30,
                  color: Colors_Purple,
                ),
              ],
            ),
          ),
          Container(
            height: Get.height * 0.065,
            width: Get.width,
            child: Align(
                alignment: Alignment.centerLeft * 0.94,
                child: Row(
                  children: [
                    Icon(
                      Icons.timer,
                      color: Colors_Purple,
                    ),
                    Text(
                      ' March 20,2021 15:35',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors_Purple,
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  _body() {
    return Container(
      height: Get.height * 0.85,
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Space',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text(
            'hofdjfosdjfodsijfoidsjfodsjfodsijfoisdjfisdijfsojdfosdjfoidsjfofgldkfjgdlkfjgldfkjgldkfjgldfjglkdjglf'
            'dlfgkjdfklgjdlkfgjdlfkjgfdlkjgldkfjglkdfsldfjsdlkfkdsjflskdjfksfjlsdkjfdslkjflskdkdjflsdjflsdkjfsdlkk',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Row(
            children: [
              Image.asset(AppImages.bookCam),
              Image.asset(AppImages.bookCam)
            ],
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text(
            'Space',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text(
            'hofdjfosdjfodsijfoidsjfodsjfodsijfoisdjfisdijfsojdfosdjfoidsjfofgldkfjgdlkfjgldfkjgldkfjgldfjglkdjglf'
            'dlfgkjdfklgjdlkfgjdlfkjgfdlkjgldkfjglkdfsldfjsdlkfkdsjflskdjfksfjlsdkjfdslkjflskdkdjflsdjflsdkjfsdlkk',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
