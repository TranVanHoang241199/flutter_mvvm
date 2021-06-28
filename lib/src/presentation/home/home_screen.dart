import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/home/Home_viewmodel.dart';
import 'package:flutter_app/src/presentation/presentation.dart';
import 'package:flutter_app/src/presentation/widgets/Widget_book.dart';
import 'package:flutter_app/src/presentation/widgets/widget_item_list_note_row.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';

import 'dialog/dialog_create_note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with ResponsiveWidget {
  late HomeViewModel _viewModel;
  late bool edit = false;

  // late String imgDialog = AppImages.bookCamVang;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
        viewModel: HomeViewModel(),
        onViewModelReady: (viewModel) {
          _viewModel = viewModel!..init();
        },
        builder: (context, viewModel, child) {
          return buildUi(context: context);
        });
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return SizedBox();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return _buildBody(context);
  }

  @override
  Widget buildTablet(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      body: _body(context),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors_Purple,
          child: Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () => _viewModel.goToSpeakScreen()),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                floating: true,
                expandedHeight: Get.height * 0.13,
                forceElevated: innerBoxIsScrolled,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: _appBar(),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(), // có thể cuộn luôm cả một một cụm
            child: Expanded(
              child: Column(
                children: [
                  _listNotebooks(),
                  _listNotes(),
                ],
              ),
            ),
          )),
    );
  }

  Widget _appBar() {
    return Container(
      height: Get.height * 0.15,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                      child: Container(
                          child: Icon(
                        Icons.settings,
                        size: 35,
                        color: Colors_Purple,
                      )),
                      onTap: () => _viewModel.goToSettingScreen())),
              Align(
                  alignment: Alignment.centerRight,
                  child: //edit == false ?
                      GestureDetector(
                    child: Text(
                      ' ',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors_Purple,
                          fontWeight: FontWeight.w400),
                    ),
                    // onTap: () {
                    //   setState(() {
                    //     edit = true;
                    //   });
                    // },
                  )
                  // : GestureDetector(
                  //     child: Text(
                  //       'Done',
                  //       style: TextStyle(
                  //           fontSize: 18,
                  //           color: Colors_Purple,
                  //           fontWeight: FontWeight.w400),
                  //     ),
                  //     onTap: () {
                  //       setState(() {
                  //         edit = false;
                  //       });
                  //     },
                  ), //),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Browse',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.w600),
              )),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 1,
            width: Get.width,
            decoration: BoxDecoration(color: Colors.grey[350]),
          )
        ],
      ),
    );
  }

  Widget _listNotebooks() {
    return Container(
      child: Column(
        children: [
          Container(
            height: 50,
            margin: EdgeInsets.only(left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notebooks',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                    child: Text(
                      'Show All  ',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors_Purple,
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () => _viewModel.goToShowNdScreen())
              ],
            ),
          ),
          Container(
            height: Get.height * 0.24,
            width: Get.width,
            margin: EdgeInsets.only(left: 8, right: 8),
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _createNotebookButton();
                } else {
                  return GestureDetector(
                    child: Container(
                      height: Get.height * 0.25,
                      width: Get.width * 0.3,
                      padding: const EdgeInsets.only(left: 10, top: 9),
                      child: WidgetBook(
                        primaryColor: Colors.amber,
                        title: 'my app',
                      ),
                    ),
                    onTap: () => null,
                  );

                  // WidgetNotebookItem(
                  //   imgBookList: AppImages.bookCamVang,
                  //   name: 'Fun plans',
                  //   onPressItem: () {},
                  // );
                }
              }, //WidgetNotebookItem
            ),
          ),
        ],
      ),
    );
  }

  Widget _listNotes() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notes',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  child: Text(
                    'Show All',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors_Purple,
                        fontWeight: FontWeight.w400),
                  ),
                  onTap: () => _viewModel.goToShowNScreen(),
                )
              ],
            ),
          ),
          ListView.builder(
            itemCount: 10,
            shrinkWrap:
                true, // làm cho cái list co giãn theo container(khung hình) bên ngoài
            physics:
                NeverScrollableScrollPhysics(), //set cứng list không cho di chuyển
            itemBuilder: (context, index) {
              return //edit == false?
                  GestureDetector(
                child: WidgetNoteListRow(
                  height: Get.height * 0.12,
                  nameTile: 'Trip to San fran',
                  namedata:
                      'Sanfran Was one of the coolest places i have \n ever been all the beautiful signseei...',
                  dateTile: '18/06/21',
                ),
                onTap: () => _viewModel.goToContentScreen(),
              );
              // : WidgetNoteListRowHai(
              //     height: 100,
              //     nameTile: 'Trip to San fran',
              //     namedata:
              //         'Sanfran Was one of the coolest places i have \n ever been all the beautiful signseei...',
              //     dateTile: '18/06/21',
              //   );
            },
          ),
        ],
      ),
    );
  }

  Widget _createNotebookButton() {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 12, right: 2, left: 3),
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(3),
              color: Colors_Purple,
              dashPattern: [8, 7],
              strokeWidth: 1.8,
              child: Container(
                width: Get.width * 0.22,
                height: Get.height * 0.155,
                child: Icon(
                  Icons.add_circle_outline_rounded,
                  size: 32,
                  color: Colors_Purple,
                ),
              ),
            ),
          ),
          Container(
            height: Get.height * 0.04,
            width: Get.width * 0.25,
            child: Text(
              'Cerate NoteBook',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors_Purple,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
      onTap: () => Get.dialog(DialogCreateNote()),
    );
  }
}
