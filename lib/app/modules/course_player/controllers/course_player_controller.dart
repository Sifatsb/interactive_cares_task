import 'package:get/get.dart';
import 'package:interactive_cares_task/app/data/dummy_data/data_controller.dart';
import 'package:interactive_cares_task/app/routes/app_pages.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../utilities/widgets/common_widgets/custom_alert_dialog.dart';

class CoursePlayerController extends GetxController {
  late YoutubePlayerController youtubeController;
  RxInt currentModuleIndex = 0.obs;
  RxBool isVideoCompleted = false.obs;

  DataController dataController = Get.find();

  void _videoController() {
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

  @override
  void onInit() {
    _videoController();
    super.onInit();
  }

  @override
  void dispose() {
    youtubeController.dispose();
    super.dispose();
  }
}
