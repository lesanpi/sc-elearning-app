import 'package:flutter/material.dart';
import 'package:sc_elearning/model/Course.dart';
import 'package:sc_elearning/widgets/content_list.dart';

class CourseScreen extends StatelessWidget {
  Course course;

  CourseScreen({required this.course});

  @override
  Widget build(BuildContext context) {
    return courseScreen(context);
  }

  Widget courseScreen(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final logo =
        isDarkTheme ? 'assets/logo_white.png' : 'assets/logo_black.png';

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: isDarkTheme ? Colors.grey.shade900 : Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  blurRadius: 0.1,
                  spreadRadius: 0.1,
                )
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    child: Container(
                      child: const Text(
                        "👈",
                        style: TextStyle(
                          fontSize: 25,
                          // color: Color(0xFF333333),
                          //Colors.white,
                          fontWeight: FontWeight.bold,
                          //fontFamily:
                        ),
                        textAlign: TextAlign.center,
                      ),
                      margin: EdgeInsets.only(right: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    }),
                Text(
                  course.title, //"Aprende sobre matematicas",
                  style: TextStyle(
                    fontSize: 21,
                    color: isDarkTheme ? Colors.white : Color(0xFF333333),
                    //Colors.white,
                    fontWeight: FontWeight.w900,
                    //fontFamily:
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(logo), fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(80),
        ),
        body: SafeArea(child: courseScreenUI(context)),
      ),
    );
  }

  Widget courseScreenUI(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final logo =
        isDarkTheme ? 'assets/logo_white.png' : 'assets/logo_black.png';

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: screenWidth,
            child: Center(
              child: Image.asset(
                course.emoji,
                width: 180,
                height: 180,
              ),
            ),
            margin: const EdgeInsets.symmetric(vertical: 20),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 0),
            child: Text(
              course.description,
              style: TextStyle(
                color: isDarkTheme ? Colors.grey.shade100 : Color(0xFF333333),
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          ContentList(
            contentList: course.contentList,
            course: course,
          )
        ],
      ),
    );
  }
}
