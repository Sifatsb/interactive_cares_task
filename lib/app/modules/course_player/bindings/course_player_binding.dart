import 'package:get/get.dart';

import '../controllers/course_player_controller.dart';

class CoursePlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoursePlayerController>(
      () => CoursePlayerController(),
    );
  }
}
