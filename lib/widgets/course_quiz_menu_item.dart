import 'package:flutter/material.dart';
import 'package:sc_elearning/model/App.dart';
import 'package:sc_elearning/model/CourseQuiz.dart';
import 'package:sc_elearning/screens/quizes_screen.dart';
import 'package:sc_elearning/widgets/progress_bar.dart';

class CourseQuizMenuItem extends StatelessWidget {
  CourseQuiz courseQuiz;
  Color color;
  String emoji;

  CourseQuizMenuItem(
      {required this.courseQuiz, required this.color, required this.emoji});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(children: [
          Container(
              width: screenWidth,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Image.asset(
                      emoji,
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            courseQuiz.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            courseQuiz.description,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          ProgressBar(
                            total: courseQuiz.quizes.length,
                            id: courseQuiz.id,
                            width: (screenWidth - 50 - 60 - 20) * 2 / 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          Container(
            width: screenWidth,
            height: 50,
            decoration: BoxDecoration(
                color: App.darkBlue,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20))),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Text(
                "${courseQuiz.quizes.length} Quiz/es",
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
            ),
          )
        ]),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => QuizesScreen(
                    courseQuiz: courseQuiz,
                  )),
        );
      },
    );
  }
}
