import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:interactive_cares_task/app/data/constants/app_colors.dart';
import 'package:interactive_cares_task/app/data/constants/app_image.dart';
import 'package:interactive_cares_task/app/data/dummy_data/course_dummy_data.dart';
import 'package:interactive_cares_task/app/modules/home/views/widgets/course_tile.dart';
import 'package:interactive_cares_task/app/routes/app_pages.dart';
import 'package:interactive_cares_task/app/utilities/widgets/common_widgets/primary_button.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: controller.enrolledCourses.length,
        itemBuilder: (context, index) {
          return CourseTile(
            onPressed: (){
              controller.dataController.title.value = controller.enrolledCourses[index].title;
              controller.dataController.videoUrl.value = controller.enrolledCourses[index].onlineVideoLink;
              Get.toNamed(Routes.COURSE_PLAYER);
            },
            title: controller.enrolledCourses[index].title,
            description: controller.enrolledCourses[index].description,
            imagePath: controller.enrolledCourses[index].thumbnail,
          );
        },
      ),
    );
  }
}
