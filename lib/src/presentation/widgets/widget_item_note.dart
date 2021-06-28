import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';

class WidgetNotebookItem extends StatelessWidget {
  final double height;
  final double width;
  final GestureTapCallback? onPressItem;
  final String imgBookList;
  final String name;
  const WidgetNotebookItem({
    Key? key,
    required this.height,
    required this.width,
    required this.imgBookList,
    required this.name,
    this.onPressItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressItem,
      child: Container(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 2, left: 10),
              child: Container(
                width: width,
                child: Image.asset(
                  imgBookList,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  name,
                  style: STYLE_MEDIUM.copyWith(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
