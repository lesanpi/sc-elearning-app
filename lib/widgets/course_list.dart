import 'package:flutter/material.dart';
import 'package:sc_elearning/model/App.dart';
import 'package:sc_elearning/model/Course.dart';
import 'package:sc_elearning/widgets/course_item.dart';

class CourseList extends StatelessWidget {
  List<Course> course_list;

  CourseList({required this.course_list});

  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    this.screenWidth = screenWidth;

    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 0,
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cursos",
            style: TextStyle(
                color: isDarkTheme ? Colors.white : Color(0xFF333333),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          Container(
            width: screenWidth,
            height: 200, //125,
            margin: EdgeInsets.only(top: 10),
            child: ListView(
              children: courseListView(course_list, context),
              scrollDirection: Axis.horizontal,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
          )
        ],
      ),
    );
  }

  List<Widget> courseListView(List<Course> course_list, BuildContext context) {
    List<Widget> courseListItems = [];
    int i = 0;
    List<String> emojis = ["🦁", "🦒", "🐊", "🦜", "🐳"];
    course_list.forEach((course) {
      courseListItems
          .add(courseListItem(course, colors[i], emojis[i], context));
      i++;
    });

    return courseListItems;
  }

  Widget courseListItem(
      Course course, Color color, String emoji, BuildContext context) {
    return CourseItem(
      course: course,
      color: color,
      emoji: emoji,
    );
  }
}
