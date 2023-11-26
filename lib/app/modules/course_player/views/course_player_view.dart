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
      body: Obx(() => SingleChildScrollView(
            child: Column(
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
                      for (int i = 0; i < controller.modules.length; i++)
                        ListTile(
                          title: Text(controller.modules[i].title),
                          tileColor: controller.currentModuleIndex.value == i
                              ? Colors.grey[300]
                              : null,
                          onTap: () {
                            controller.youtubeController
                                .load(controller.modules[i].title);

                            controller.currentModuleIndex.value = i;
                          },
                        ),
                      10.verticalSpacing,
                      /// Next Button
                      PrimaryButton(
                        width: 150,
                        borderRadius: 5,
                        onTap: () {
                          if (controller.currentModuleIndex <
                              controller.modules.length - 1) {
                            controller.currentModuleIndex++;
                            controller.youtubeController.load(controller
                                .modules[controller.currentModuleIndex.value]
                                .title);
                            controller.dataController.videoUrl.value = controller.modules[controller.currentModuleIndex.value].onlineVideoLink;
                            controller.playVideo();
                          }
                        },
                        text: 'Next Module',
                      ),
                      10.verticalSpacing,
                      /// Previous Button
                      PrimaryButton(
                        width: 150,
                        borderRadius: 5,
                        onTap: () {
                          if (controller.currentModuleIndex > 0) {
                            controller.currentModuleIndex--;
                            controller.youtubeController.load(controller
                                .modules[controller.currentModuleIndex.value]
                                .title);
                            controller.dataController.videoUrl.value = controller.modules[controller.currentModuleIndex.value].onlineVideoLink;
                            controller.playVideo();
                          }
                        },
                        text: 'Previous Module',
                      ),
                      10.verticalSpacing,
                      PrimaryButton(
                        width: 150,
                        borderRadius: 5,
                        onTap: () {
                          controller.addBookmark();
                        },
                        text: 'Bookmark',
                      ),
                      10.verticalSpacing,
                      Text('Bookmarks',
                          style: Theme.of(context).textTheme.titleLarge),
                      if (controller.bookmarks.isEmpty)
                        const Text('No bookmarks available.'),
                      Column(
                        children: [
                          for (Bookmark bookmark in controller.bookmarks)
                            ListTile(
                              title: Text(
                                  'Module: ${bookmark.module} - Time: ${bookmark.time}s'),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  // Implement delete bookmark functionality
                                  controller.removeBookmark(bookmark);
                                },
                              ),
                            ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
