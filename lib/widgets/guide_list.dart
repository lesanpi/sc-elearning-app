import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sc_elearning/model/Guide.dart';
import 'package:sc_elearning/widgets/guide_item.dart';

class GuideList extends StatelessWidget {
  List<Guide> guideList;

  double screenWidth = 0;
  double width = 100;

  GuideList({this.guideList = const []});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    this.screenWidth = screenWidth;
    this.width = screenWidth - 20;
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: listUi(guideList, isDarkTheme)),
    );
  }

  List<Widget> listUi(List<Guide> guideList, bool isDarkTheme) {
    List<Widget> listUiWidgets = [
      Text(
        "Guias",
        style: TextStyle(
            color: isDarkTheme ? Colors.white : Color(0xFF333333),
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
    ];

    listUiWidgets.addAll(guideListItem(guideList));

    return listUiWidgets;
  }

  List<Widget> guideListItem(List<Guide> guideList) {
    List<Widget> guideListWidgets = [];
    guideList.forEach((guide) {
      guideListWidgets.add(guideItem(guide));
    });

    return guideListWidgets;
  }

  Widget guideItem(Guide guide) {
    return GuideItem(
      guide: guide,
      width: this.width,
    );
  }
}
