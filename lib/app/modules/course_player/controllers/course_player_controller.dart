import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_task/app/data/dummy_data/course_dummy_data.dart';
import 'package:interactive_cares_task/app/data/dummy_data/data_controller.dart';
import 'package:interactive_cares_task/app/routes/app_pages.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../utilities/widgets/common_widgets/custom_alert_dialog.dart';

class CoursePlayerController extends GetxController {
  late YoutubePlayerController youtubeController;
  RxInt currentModuleIndex = 0.obs;
  RxBool isVideoCompleted = false.obs;

  RxList<Bookmark> bookmarks = <Bookmark>[].obs;

  DataController dataController = Get.find();

  List<Module> modules = [
    Module(
        title: "Module 1: Introduction",
        onlineVideoLink: 'https://www.youtube.com/watch?v=nXXvWXgXEYs'),
    Module(
        title: "Module 2: Getting Started",
        onlineVideoLink: 'https://www.youtube.com/watch?v=bzhmgkuR0dU&t=12s'),
    Module(
        title: "Module 3: Advanced Topics",
        onlineVideoLink: 'https://www.youtube.com/watch?v=9OxxU4RlCkk'),
  ];

  void playVideo() {
    debugPrint(dataController.videoUrl.value);
    youtubeController = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(dataController.videoUrl.value) ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        isLive: false,
      ),
    )..addListener(() {
        if (youtubeController.value.playerState == PlayerState.ended) {
          isVideoCompleted.value = true;
          showDialog();
        }
      });
  }

  void showDialog() {
    Get.dialog(
      CustomAlertDialogue(
        subTitle: "Claim Your Certificate.",
        onYesTap: () {
          Get.offAllNamed(Routes.HOME);
        },
      ),
    );
  }

  // Function to add a bookmark
  void addBookmark() {
    double currentTime = youtubeController.value.position.inSeconds.toDouble();
    String currentModule = modules[currentModuleIndex.value].title;
    Bookmark bookmark = Bookmark(module: currentModule, time: currentTime);

    bookmarks.add(bookmark);
  }

  // Function to remove a bookmark
  void removeBookmark(Bookmark bookmark) {
    bookmarks.remove(bookmark);
  }

  // Function to seek to a relative time in the video
  void seekToRelativeTime(double seconds) {
    double newTime =
        youtubeController.value.position.inSeconds.toDouble() + seconds;
    youtubeController.seekTo(Duration(seconds: newTime.toInt()));
  }

  @override
  void onInit() {
    playVideo();
    super.onInit();
  }

  @override
  void dispose() {
    youtubeController.dispose();
    super.dispose();
  }
}
