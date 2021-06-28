import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:get/get.dart';
import '../presentation.dart';

class SplashSceen extends StatefulWidget {
  const SplashSceen({Key? key}) : super(key: key);

  @override
  _SplashSceenState createState() => _SplashSceenState();
}

class _SplashSceenState extends State<SplashSceen> with ResponsiveWidget {
  late SplashViewModel _viewModel;
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget build(BuildContext context) {
    return BaseWidget<SplashViewModel>(
        viewModel: SplashViewModel(),
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
    return _buildBody(context);
  }

  @override
  Widget buildTablet(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(color: Colors_Grey),
      child: Stack(
        children: [
          _pageView(),
          _buttonBelow(context),
        ],
      ),
    );
  }

  Widget _buttonBelow(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height / 9,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                child: Container(
                  height: 40,
                  width: 80,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Center(child: Text('Skip')),
                ),
                onTap: () => _viewModel.goToHomeScreen(),
              ),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 40,
                  width: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: _buildPageIndicator(),
                  ),
                )),
            _buttonNext(),
          ],
        ),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          color: isActive ? Colors_Purple : Colors.grey,
          borderRadius: BorderRadius.circular(12)),
    );
  }

  Widget _buttonNext() {
    return (_currentPage != _numPages - 1
        ? Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              child: Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors_Purple),
                child: Center(
                    child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                )),
              ),
              onTap: () {
                _pageController.nextPage(
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
            ),
          )
        : Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
                child: Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors_Purple),
                  child: Center(
                      child: Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                onTap: () => _viewModel.goToHomeScreen()),
          ));
  }

  Widget _pageView() {
    return PageView(
      physics: ClampingScrollPhysics(),
      controller: _pageController,
      onPageChanged: (int page) {
        setState(() {
          _currentPage = page;
          print(page);
        });
      },
      children: <Widget>[
        Stack(
          children: [
            Center(
              child: imgbookDS(),
            ),
            CustomPaint(
              painter: FaceOutlinePainterT(),
              child: bodyPartNoteBook(context),
            ),
          ],
        ),
        Stack(
          children: [
            Center(
              child: imgSpeech(context),
            ),
            CustomPaint(
              painter: FaceOutlinePainterD(),
              child: bodyPartSpeech(context),
            ),
          ],
        ),
        Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: imgAddNote(context),
            ),
            CustomPaint(
              painter: FaceOutlinePainterT(),
              child: bodyPartAddNote(context),
            ),
          ],
        ),
      ],
    );
  }

  Widget bodyPartNoteBook(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height / 2.7,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white),
        child: textNoteBook(),
      ),
    );
  }

  Widget bodyPartSpeech(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomPaint(
        painter: FaceOutlinePainterD(),
        child: Container(
          height: MediaQuery.of(context).size.height / 2.7,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
          child: textSpeeck(),
        ),
      ),
    );
  }

  Widget bodyPartAddNote(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomPaint(
        painter: FaceOutlinePainterT(),
        child: Container(
          height: MediaQuery.of(context).size.height / 2.7,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
          child: textAddNote(),
        ),
      ),
    );
  }

  Widget textNoteBook() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'NoteBooks',
          style: TextStyle(color: Colors.purple, fontSize: 25),
        ),
        SizedBox(
          height: 45,
        ),
        Text(
          'Nottebook are the best place',
          style: TextStyle(color: Colors_Purple),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'to manage your ',
              style: TextStyle(color: Colors_Purple),
            ),
            Text(
              "Notes",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }

  Widget textSpeeck() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Speech to Text',
          style: TextStyle(color: Colors.purple, fontSize: 25),
        ),
        SizedBox(
          height: 45,
        ),
        Text(
          'Why write note can do',
          style: TextStyle(color: Colors_Purple),
        ),
        Text(
          'that for you just say an it will',
          style: TextStyle(color: Colors_Purple),
        ),
        Text(
          'become text',
          style: TextStyle(color: Colors_Purple),
        ),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }

  Widget textAddNote() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Add Notes to Notebook',
          style: TextStyle(color: Colors.purple, fontSize: 25),
        ),
        SizedBox(
          height: 45,
        ),
        Text(
          'Simply create your note and',
          style: TextStyle(color: Colors_Purple),
        ),
        Text(
          'add it to your favorite',
          style: TextStyle(color: Colors_Purple),
        ),
        Text(
          'notebook',
          style: TextStyle(color: Colors_Purple),
        ),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }

  Widget imgbookDS() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Image.asset(
              AppImages.bookXanh,
              height: 137,
              width: 105,
            ),
            Image.asset(
              AppImages.bookXLuc,
              height: 137,
              width: 105,
            ),
            Image.asset(
              AppImages.bookCamVang,
              height: 137,
              width: 105,
            ),
          ],
        ),
        Column(
          children: [
            Image.asset(
              AppImages.bookXanhTim,
              height: 137,
              width: 105,
            ),
            Image.asset(
              AppImages.bookCam,
              height: 137,
              width: 105,
            ),
            Image.asset(
              AppImages.bookHong,
              height: 137,
              width: 105,
            ),
            Image.asset(
              AppImages.bookXanhTrang,
              height: 137,
              width: 105,
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Image.asset(
              AppImages.bookXanhDen,
              height: 137,
              width: 105,
            ),
            Image.asset(
              AppImages.bookTim,
              height: 137,
              width: 105,
            ),
            Image.asset(
              AppImages.bookXanhDam,
              height: 137,
              width: 105,
            ),
          ],
        )
      ],
    );
  }

  Widget imgSpeech(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            child: Image.asset(AppImages.songAm),
          ),
        ],
      ),
    );
  }

  Widget imgAddNote(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(AppImages.bookImg),
        SizedBox(
          width: 60,
        ),
        Image.asset(AppImages.notesBook),
      ]),
    );
  }
}

class FaceOutlinePainterT extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, size.height / 1.72, size.width, size.height / 2);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(FaceOutlinePainterT oldDelegate) => false;
}

class FaceOutlinePainterD extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2.5, size.width, size.height / 2);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(FaceOutlinePainterD oldDelegate) => false;
}
