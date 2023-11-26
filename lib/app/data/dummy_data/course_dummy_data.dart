import 'package:interactive_cares_task/app/data/constants/app_image.dart';

class Course {
  final String id;
  final String title;
  final String onlineVideoLink;
  final String description;
  final String thumbnail;

  Course({
    required this.id,
    required this.title,
    required this.onlineVideoLink,
    required this.description,
    required this.thumbnail,
  });
}

class Module {
  final String title;

  Module(this.title);
}

List<Module> modules = [
  Module("Module 1: Introduction"),
  Module("Module 2: Getting Started"),
  Module("Module 3: Advanced Topics"),
];