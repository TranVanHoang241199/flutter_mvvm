import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/shownotes/shown.dart';
import 'package:flutter_app/src/presentation/widgets/Widget_Note_List_Row_Hai.dart';
import 'package:flutter_app/src/presentation/widgets/widget_item_list_note_row.dart';
import 'package:get/get.dart';

import '../presentation.dart';

class ShowNScreen extends StatefulWidget {
  const ShowNScreen({Key? key}) : super(key: key);

  @override
  _ShowNScreenState createState() => _ShowNScreenState();
}

class _ShowNScreenState extends State<ShowNScreen> with ResponsiveWidget {
  late ShowNViewModel _viewModel;
  late int index = 1;
  late bool edit = false;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ShowNViewModel>(
        viewModel: ShowNViewModel(),
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
        body: Expanded(
          child: index != 0 ? _wapviewHai() : _wapviewMot(),
        ));
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
            'Shakespeare',
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
          Icon(Icons.menu_book, size: 120, color: Colors.grey[400]),
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
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return edit == false
              ? GestureDetector(
                  child: WidgetNoteListRow(
                    height: Get.height * 0.12,
                    nameTile: 'Trip to San fran',
                    namedata:
                        'Sanfran Was one of the coolest places i have \n ever been all the beautiful signseei...',
                    dateTile: '18/06/21',
                  ),
                  onTap: () => _viewModel.goToContentScreen(),
                )
              : WidgetNoteListRowHai(
                  height: 100,
                  nameTile: 'Trip to San fran',
                  namedata:
                      'Sanfran Was one of the coolest places i have \n ever been all the beautiful signseei...',
                  dateTile: '18/06/21',
                );
        },
      ),
    );
  }
}
