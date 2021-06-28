import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:get/get.dart';

class DialogCreateNote extends StatefulWidget {
  const DialogCreateNote({Key? key}) : super(key: key);

  @override
  _DialogCreateNoteState createState() => _DialogCreateNoteState();
}

List<Color> mycolors = <Color>[
  Colors.orange,
  Colors.amber,
  Colors.yellow,
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
  Colors.pink,
  Colors.blueGrey,
  Colors.brown,
  Colors.grey,
  Colors.black,
  Colors.white30,
];
Color primaryColor = mycolors[1];

class _DialogCreateNoteState extends State<DialogCreateNote> {
  late String imgDialog = AppImages.bookCamVang;
  TextEditingController controller = TextEditingController();
  String value = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(left: 35, right: 35),
        child: Center(
          child: Container(
            height: Get.height * 0.87,
            width: Get.width,
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.9),
            ),
            child: Column(
              children: [
                _bodyDialogTop(),
                _bodyDialogBottom(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bodyDialogTop() {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  child: Text(
                    'Cancel ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors_Purple),
                  ),
                  onTap: () => Get.back(),
                )),
            SizedBox(
              height: Get.height * 0.06,
            ),
            Column(
              children: [
                Container(
                  height: Get.height * 0.16,
                  width: Get.width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                          alignment: Alignment.bottomLeft * 0.7,
                          child: Image.asset(AppImages.thanhNganBaCham)),
                      SizedBox(),
                      Image.asset(
                        AppImages.thanhDungBook,
                        fit: BoxFit.fitHeight,
                        height: Get.height * 0.19,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: Get.height * 0.1,
                  width: Get.width * 0.2,
                  child: Center(
                    child: Expanded(
                      child: TextField(
                        controller: controller,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Name',
                        ),
                        onChanged: (text) {
                          value = text;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyDialogBottom() {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.04,
            ),
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors_Purple,
              ),
              child: Center(
                child: Text(
                  'Save',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Container(
              height: Get.height * 0.29,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: GridView.count(
                physics: BouncingScrollPhysics(),
                crossAxisCount: 4,
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 20),
                children: List.generate(14, (index) {
                  return buildIconBtn(mycolors[index]);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIconBtn(Color myColor) => Container(
        child: Stack(
          children: [
            IconButton(
              icon: Icon(
                Icons.circle,
                color: myColor.withOpacity(0.65),
                size: 50,
              ),
              onPressed: () {
                setState(() {
                  primaryColor = myColor;
                });
              },
            ),
          ],
        ),
      );
}
