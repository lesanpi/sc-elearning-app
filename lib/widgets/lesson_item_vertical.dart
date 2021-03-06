import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sc_elearning/model/Lesson.dart';

class LessonItemVertical extends StatelessWidget {
  Lesson lesson;
  bool mini;
  bool currentLesson;

  LessonItemVertical(
      {required this.lesson, this.mini = false, this.currentLesson = false});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    double itemHeight = 210;

    if (this.mini) {
      return Container(
        width: screenWidth,
        height: 80,
        margin: const EdgeInsets.only(
          top: 1,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            color: currentLesson
                ? Colors.blue.withOpacity(0.5)
                : isDarkTheme
                    ? Colors.grey.shade900
                    : Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                blurRadius: 1,
                spreadRadius: 0.1,
              )
            ]),
        child: Row(
          children: [
            const InkWell(
              child: Text(
                "▶",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Expanded(
              child: Container(
              child: Text(
                lesson.title,
                    overflow: TextOverflow.ellipsis,

                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: currentLesson
                        ? Colors.white
                        : isDarkTheme
                            ? Colors.white
                            : Color(0xFF333333), //Colors.black87,
                    fontSize: 15),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
            )
          ],
        ),
      );
    }

    return Container(
      width: screenWidth,
      margin: EdgeInsets.only(
        bottom: 10,
        top: 10,
      ),
      decoration: BoxDecoration(
          color: isDarkTheme ? Colors.grey.shade900 : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 1,
              spreadRadius: 0.1,
            )
          ]),
      child: Row(
        children: [
          Container(
            width: (screenWidth * 3 / 8) - 10,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    blurRadius: 1,
                    spreadRadius: 0.1,
                  )
                ],
                image: DecorationImage(
                    image: CachedNetworkImageProvider(lesson.image_url),
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft)),
          ),
          Container(
            //color: Colors.green,
            height: 150,
            width: (screenWidth * 5 / 8) - 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  lesson.title,
                  maxLines: 2,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // color: Color(0xFF333333), //Colors.black54,
                      fontSize: 17),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  lesson.description,
                  maxLines: 4,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      // color: Colors.black54,
                      fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
            padding: EdgeInsets.all(10),
          )
        ],
      ),
    );
  }
}
