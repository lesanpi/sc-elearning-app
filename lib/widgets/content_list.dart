import 'package:flutter/material.dart';
import 'package:sc_elearning/model/Content.dart';
import 'package:sc_elearning/model/Course.dart';
import 'package:sc_elearning/model/Guide.dart';
import 'package:sc_elearning/model/Lesson.dart';
import 'package:sc_elearning/widgets/guide_item.dart';
import 'package:sc_elearning/widgets/lesson_item.dart';

class ContentList extends StatelessWidget {
  double screenWidth = 0;
  double itemHeight = 0;
  bool mini;
  List<Content> contentList;
  Course course;
  String currentContentId;

  ContentList(
      {required this.course,
      this.contentList = const [],
      this.mini = false,
      this.currentContentId = ""});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    this.screenWidth = screenWidth;

    double screenHeight = MediaQuery.of(context).size.height;
    this.screenWidth = screenHeight;
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
        margin: EdgeInsets.only(
          left: this.mini ? 0 : 20,
          right: this.mini ? 0 : 20,
          top: mini ? 0 : 30,
        ),
        child: SingleChildScrollView(
          child: mini
              ? Column(
                  children: [
                    Container(
                      child: Text(
                        "Lecciones",
                        style: TextStyle(
                          color: isDarkTheme
                              ? Colors.grey.shade100
                              : Color(0xFF333333),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      margin:
                          EdgeInsets.only(left: this.mini ? 20 : 0, bottom: 10),
                      width: screenWidth,
                    ),
                    Container(
                      child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView(
                            children: listUi(contentList, isDarkTheme),
                          )),
                      width: screenWidth,
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: listUi(contentList, isDarkTheme),
                ),
        ));
  }

  List<Widget> listUi(List<Content> contentList, bool isDarkTheme) {
    List<Widget> listUi = [
      mini
          ? SizedBox.shrink()
          : Container(
              child: Text(
                "Lecciones",
                style: TextStyle(
                  color: isDarkTheme ? Colors.grey.shade100 : Color(0xFF333333),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              margin: EdgeInsets.only(left: this.mini ? 20 : 0),
              width: screenWidth,
            )
    ];
    double height = 0;
    List<Widget> contentItems = [];
    List items = contentListItems(contentList);

    height = items[0];
    contentItems = items[1];

    listUi.add(Container(
      width: screenWidth,
      height: height,
      margin: EdgeInsets.only(top: mini ? 0 : 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: contentItems,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ));

    return contentItems;
  }

  List contentListItems(List<Content> contentList) {
    double height = 0;
    List<Widget> contentListWidget = [];

    contentList.forEach((content) {
      if (content is Lesson) {
        height += mini ? 81 : 190;
        final lesson = content as Lesson;

        contentListWidget.add(LessonItem(
          lesson: content as Lesson,
          mini: this.mini,
          course: content.course,
          currentLesson: lesson.id == currentContentId,
        ));
      } else if (content is Guide) {
        height += mini ? 81 : 70;
        contentListWidget.add(GuideItem(
          guide: content as Guide,
          mini: this.mini,
        ));
      }
    });

    contentListWidget.add(SizedBox(height: 60));

    return [height, contentListWidget];
  }
}
