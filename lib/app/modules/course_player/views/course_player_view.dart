import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:interactive_cares_task/app/data/constants/app_colors.dart';
import 'package:interactive_cares_task/app/data/dummy_data/course_dummy_data.dart';
import 'package:interactive_cares_task/app/utilities/extensions/widget.extensions.dart';
import 'package:interactive_cares_task/app/utilities/widgets/common_widgets/primary_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controllers/course_player_controller.dart';

class CoursePlayerView extends GetView<CoursePlayerController> {
  const CoursePlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(controller.dataController.title.value),
      ),
      body: Obx(() => Column(
            children: [
              YoutubePlayer(
                controller: controller.youtubeController,
                showVideoProgressIndicator: true,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Modules',
                        style: Theme.of(context).textTheme.titleLarge),
                    for (int i = 0; i < modules.length; i++)
                      ListTile(
                        title: Text(modules[i].title),
                        tileColor: controller.currentModuleIndex.value == i
                            ? Colors.grey[300]
                            : null,
                        onTap: () {
                          controller.youtubeController.load(modules[i].title);

                          controller.currentModuleIndex.value = i;
                        },
                      ),
                    PrimaryButton(
                      width: 150,
                      borderRadius: 5,
                      onTap: () {},
                      text: 'Bookmark',
                    ),
                    10.verticalSpacing,
                    PrimaryButton(
                      width: 150,
                      borderRadius: 5,
                      onTap: () {
                        if (controller.currentModuleIndex <
                            modules.length - 1) {
                          controller.currentModuleIndex++;
                          controller.youtubeController.load(
                              modules[controller.currentModuleIndex.value]
                                  .title);
                        }
                      },
                      text: 'Next Module',
                    ),
                    10.verticalSpacing,
                    PrimaryButton(
                      width: 150,
                      borderRadius: 5,
                      onTap: () {
                        if (controller.currentModuleIndex > 0) {
                          controller.currentModuleIndex--;
                          controller.youtubeController.load(
                              modules[controller.currentModuleIndex.value]
                                  .title);
                        }
                      },
                      text: 'Previous Module',
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
