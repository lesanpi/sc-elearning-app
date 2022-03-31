import 'package:flutter/material.dart';
import 'package:sc_elearning/model/Content.dart';

class Lesson extends Content {
  final String description;
  String video_url;
  String video_id;
  String image_url;

  Lesson(
      {required title,
      required id,
      required this.description,
      required this.video_url,
      required this.video_id,
      required this.image_url})
      : super(id: id, title: title);
}
