import 'package:sc_elearning/model/Quiz.dart';

class CourseQuiz {
  String id;
  String name;
  String description;
  List<Quiz> quizes;

  CourseQuiz(
      {required this.id,
      required this.name,
      required this.description,
      required this.quizes});
}
