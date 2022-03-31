import 'package:flutter/material.dart';
import 'package:sc_elearning/model/Content.dart';

class Guide extends Content {
  String url;
  String img_url;

  Guide({required id, required title, required this.url, required this.img_url})
      : super(id: id, title: title);
}
