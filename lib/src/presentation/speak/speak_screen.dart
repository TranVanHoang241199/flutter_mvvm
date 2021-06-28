import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/speak/speak.dart';
import 'package:get/get.dart';

import '../presentation.dart';

class SpeakSc extends StatefulWidget {
  const SpeakSc({Key? key}) : super(key: key);

  @override
  _SpeakScState createState() => _SpeakScState();
}

class _SpeakScState extends State<SpeakSc> with ResponsiveWidget {
  late SpeakViewModel _viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<SpeakViewModel>(
        viewModel: SpeakViewModel(),
        onViewModelReady: (viewModel) {
          _viewModel = viewModel!..init();
        },
        builder: (context, viewModel, child) {
          return Scaffold(
            body: buildUi(context: context),
            floatingActionButton: FloatingActionButton(
                backgroundColor: Colors_Purple,
                child: Icon(
                  Icons.mic_none,
                  size: 30,
                ),
                onPressed: null),
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
              expandedHeight: Get.height * 0.147,
              forceElevated: innerBoxIsScrolled,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: _appBar(),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
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
                Text(
                  'save',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors_Purple,
                  ),
                )
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
                      ' Settings 20,2021 20:28',
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

  Widget _body() {
    return Container();
  }
}
