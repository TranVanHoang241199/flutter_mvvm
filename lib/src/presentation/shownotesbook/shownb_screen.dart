import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/widgets/Widget_book.dart';
import 'package:flutter_app/src/presentation/widgets/widget_book_edit.dart';
import 'package:get/get.dart';

import '../presentation.dart';
import 'shownb.dart';

class ShowNdScreen extends StatefulWidget {
  const ShowNdScreen({Key? key}) : super(key: key);

  @override
  _ShowNdScreenState createState() => _ShowNdScreenState();
}

class _ShowNdScreenState extends State<ShowNdScreen> with ResponsiveWidget {
  late ShowNBViewModel _viewModel;
  late int index = 1;
  late bool edit = false;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ShowNBViewModel>(
        viewModel: ShowNBViewModel(),
        onViewModelReady: (viewModel) {
          _viewModel = viewModel!..init();
        },
        builder: (context, viewModel, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: buildUi(context: context),
            floatingActionButton: FloatingActionButton(
                backgroundColor: Colors_Purple,
                child: Icon(
                  Icons.add,
                  size: 30,
                ),
                onPressed: () => _viewModel.goToSpeakScreen()),
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
              expandedHeight: Get.height * 0.24,
              forceElevated: innerBoxIsScrolled,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: _appBar(),
              ),
            ),
          ];
        },
        body: Expanded(child: index == 0 ? _wapviewMot() : _wapviewHai()));
  }

  Widget _appBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: Get.height * 0.25,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors_Purple,
                    size: 31,
                  ),
                  onTap: () => _viewModel.goToHomeScreen(),
                ),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: edit == false
                      ? GestureDetector(
                          child: Text(
                            'Edit',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors_Purple,
                                fontWeight: FontWeight.w400),
                          ),
                          onTap: () {
                            setState(() {
                              edit = true;
                            });
                          },
                        )
                      : GestureDetector(
                          child: Text(
                            'Done',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors_Purple,
                                fontWeight: FontWeight.w400),
                          ),
                          onTap: () {
                            setState(() {
                              edit = false;
                            });
                          },
                        )),
            ],
          ),
          Text(
            'Notebooks',
            style: TextStyle(
                color: Colors.black, fontSize: 35, fontWeight: FontWeight.w700),
          ),
          Container(
            height: Get.height * 0.055,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search)),
            ),
          )
        ],
      ),
    );
  }

  Widget _wapviewMot() {
    return Container(
      height: Get.height * 0.75,
      width: Get.width,
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.1,
          ),
          Icon(Icons.menu_book, size: 120, color: Colors.grey[300]),
          SizedBox(
            height: Get.height * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Let\'s create a',
                style: TextStyle(color: Colors.grey[400]),
              ),
              Text(
                ' Note ',
                style: TextStyle(
                    color: Colors_Purple, fontWeight: FontWeight.bold),
              ),
              Text(
                'together',
                style: TextStyle(color: Colors.grey[400]),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _wapviewHai() {
    return Container(
        height: Get.height * 0.75,
        width: Get.width,
        child: GridView.count(
          physics: BouncingScrollPhysics(),
          crossAxisCount: 3,
          padding: EdgeInsets.all(13),
          childAspectRatio: 3 / 5,
          children: List.generate(20, (index) {
            return Container(
              margin: EdgeInsets.only(left: 12, right: 12, top: 7),
              child: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    edit == true
                        ? WidgetBookEdit(
                            primaryColor: Colors.amber,
                            title: 'my app',
                          )
                        : WidgetBook(
                            primaryColor: Colors.amber,
                            title: 'my app',
                          ),
                  ],
                ),
              ),
            );
          }),
        ));
  }
}
