import 'package:get/get.dart';
import 'package:interactive_cares_task/app/data/constants/app_image.dart';
import 'package:interactive_cares_task/app/data/dummy_data/course_dummy_data.dart';
import 'package:interactive_cares_task/app/data/dummy_data/data_controller.dart';

class HomeController extends GetxController {

  DataController dataController = Get.find();

  List<Course> enrolledCourses = [
    Course(
        id: '1',
        title: 'Introduction to Flutter',
        onlineVideoLink: 'https://www.youtube.com/watch?v=p5WycJpkV9E&t=33s',
        description: 'Learn the basics of Flutter and Dart programming.',
        thumbnail: AppImages.thumbnail
    ),
    Course(
        id: '2',
        title: 'Advanced Flutter Widgets',
        onlineVideoLink: 'https://www.youtube.com/watch?v=fdyo8KG54gU',
        description: 'Explore advanced Flutter widget concepts and usage.',
        thumbnail: AppImages.thumbnail
    ),
    Course(
        id: '3',
        title: 'State Management in Flutter',
        onlineVideoLink: 'https://www.youtube.com/watch?v=D20Pg5iYX8c',
        description: 'Understand different state management approaches in Flutter.',
        thumbnail: AppImages.thumbnail
    ),
  ];

}
