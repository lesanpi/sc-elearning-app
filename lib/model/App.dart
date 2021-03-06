import 'package:flutter/material.dart';
import 'package:sc_elearning/model/Content.dart';
import 'package:sc_elearning/model/Course.dart';
import 'package:sc_elearning/model/CourseQuiz.dart';
import 'package:sc_elearning/model/Guide.dart';
import 'package:sc_elearning/model/Lesson.dart';
import 'package:sc_elearning/model/Question.dart';
import 'package:sc_elearning/model/Quiz.dart';

List<String> emojis = ["🦁", "🦒", "🐊", "🦜", "🐳"];
List<Color> colors = [
  Color(0xFFFFAC2F),
  Color(0xFFCB4949),
  Color(0xFF03989E),
  Color(0xFF5A8BA6),
  Color(0xFF8C74BD),
  // App.primaryColor,
  // App.gold,
  // Colors.lightGreen,
  // Colors.redAccent,
// Colors.indigoAccent
];

class App {
  static const MaterialAccentColor primaryColor = Colors.blueAccent;
  static const Color optionColor = Color(0xFF2ed1c4);
  static const Color gold = Color.fromRGBO(255, 185, 44, 1);
  static const Color darkBlue = Color(0xFF40587c);
  static const Color greenProgress = Color(0xFF98ca3f);
  static const Color lightBlue = Color(0xFFdbf0fe);
  static const Color myBlack = Color(0xFF333333);
  static const Color myGrey = Color(0xFF444444);

  var _data;

  static List<Course> courseList(var data) {
    List<Course> _courseList = [];
    for (int i = 0; i < data.length; i++) {
      Course _course = Course(
        title: data[i]["title"],
        description: data[i]["description"],
        miniDescription: data[i]["mini_description"],
        emoji: data[i]["emoji"],
        contentList: contentList(data[i]["content"]),
      );

      _courseList.add(_course);

      for (int j = 0; j < _course.contentList.length; j++) {
        _course.contentList[j].set_course(_course);
      }
    }

    return _courseList;
  }

  static List<Content> contentList(var dataContent) {
    List<Content> _contentList = [];

    for (int i = 0; i < dataContent.length; i++) {
      if (dataContent[i]["type"] == "lesson")
        _contentList.add(Lesson(
            id: dataContent[i]["id"],
            title: dataContent[i]["title"],
            description: dataContent[i]["description"],
            image_url: dataContent[i]["img_url"],
            video_id: dataContent[i]["video_id"],
            video_url: dataContent[i]["url"]));
      else
        _contentList.add(Guide(
            id: dataContent[i]["id"],
            title: dataContent[i]["title"],
            img_url: dataContent[i]["img_url"],
            url: dataContent[i]["url"]));
    }

    return _contentList;
  }

  static List<CourseQuiz> courseQuizList(var dataCourseQuizes) {
    List<CourseQuiz> _courseQuizList = [];

    for (int i = 0; i < dataCourseQuizes.length; i++) {
      _courseQuizList.add(CourseQuiz(
          id: dataCourseQuizes[i]["id"],
          name: dataCourseQuizes[i]["title"],
          description: dataCourseQuizes[i]["description"],
          quizes: App.quizesList(dataCourseQuizes[i]["quizes"])));
    }

    return _courseQuizList;
  }

  static List<Quiz> quizesList(var dataQuizes) {
    List<Quiz> _quizes = [];
    for (int i = 0; i < dataQuizes.length; i++) {
      _quizes.add(Quiz(
          id: dataQuizes[i]["id"],
          title: dataQuizes[i]["title"],
          questions: App.questions(dataQuizes[i]["questions"])));
    }

    return _quizes;
  }

  static List<Question> questions(var dataQuiz) {
    List<Question> _questions = [];
    for (int i = 0; i < dataQuiz.length; i++) {
      _questions.add(Question(
        question: dataQuiz[i]["question"],
        option_1: dataQuiz[i]["option_1"],
        option_2: dataQuiz[i]["option_2"],
        option_3: dataQuiz[i]["option_3"],
        option_4: dataQuiz[i]["option_4"],
        correctOption: dataQuiz[i]["correct_option"],
        img: dataQuiz[i]["img"] ?? "",
      ));
    }

    return _questions;
  }
}
