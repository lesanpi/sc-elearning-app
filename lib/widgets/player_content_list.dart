import 'package:flutter/material.dart';
import 'package:sc_elearning/model/Content.dart';
import 'package:sc_elearning/model/Course.dart';
import 'package:sc_elearning/model/Guide.dart';
import 'package:sc_elearning/model/Lesson.dart';
import 'package:sc_elearning/widgets/guide_item.dart';
import 'package:sc_elearning/widgets/lesson_item.dart';

class PlayerContentList extends StatelessWidget {
  List<Content> contentList;
  Course course;
  String currentContentId;
  PlayerContentList(
      {required this.course,
      this.contentList = const [],
      this.currentContentId = ""});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Column(children: [
      Container(
        child: Text(
          "Lecciones",
          style: TextStyle(
            color: isDarkTheme ? Colors.grey.shade100 : Color(0xFF333333),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        margin: EdgeInsets.only(left: 20, bottom: 10),
        width: screenWidth,
      ),
      Expanded(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: contentList.length,
          itemBuilder: (_, index) {
            final content = contentList[index];
            if (content is Lesson) {
              final lesson = content as Lesson;
              return LessonItem(
                lesson: content as Lesson,
                mini: true,
                course: content.course,
                currentLesson: lesson.id == currentContentId,
              );
            } else if (content is Guide) {
              return GuideItem(
                guide: content as Guide,
                mini: true,
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      )
    ]);
  }
}
