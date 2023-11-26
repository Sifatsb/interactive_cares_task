import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:interactive_cares_task/app/data/constants/app_colors.dart';
import 'package:interactive_cares_task/app/data/constants/app_text_style.dart';
import 'package:interactive_cares_task/app/utilities/extensions/widget.extensions.dart';
import 'package:interactive_cares_task/app/utilities/widgets/common_widgets/custom_text_form_field.dart';
import 'package:interactive_cares_task/app/utilities/widgets/common_widgets/primary_button.dart';

import '../../../routes/app_pages.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                100.verticalSpacing,

                /// Email Text field
                CustomTextFormField(
                  controller: controller.emailTextController,
                  fillColor: const Color(0xFFFDFBFF),
                  focusBorderActive: true,
                  enableBorderActive: true,
                  hintText: "Email",
                  textInputType: TextInputType.text,
                  suffixIcon: const Icon(
                    Icons.email,
                    color: AppColors.loginIconColor,
                  ),
                ),
                10.verticalSpacing,

                /// Password Text field
                Obx(
                      () => CustomTextFormField(
                    iconOnTap: () {
                      controller.isObscureText.value =
                      !controller.isObscureText.value;
                    },
                    controller: controller.passwordTextController,
                    obsCureText: controller.isObscureText.value,
                    fillColor: const Color(0xFFF4EBFC),
                    hintText: "Password",
                    focusBorderActive: true,
                    enableBorderActive: true,
                    suffixIcon: Icon(
                      controller.isObscureText.value
                          ? Icons.lock
                          : Icons.lock_open,
                      color: AppColors.loginIconColor,
                    ),
                  ),
                ),

                20.verticalSpacing,

                GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.LOGIN);
                  },
                  child: RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: 'Already have an account? ', style: AppTextStyle.textStyle12GreyW600),
                        TextSpan(text: 'Login Now', style: AppTextStyle.textStyle12BlackW700)
                      ],
                    ),
                    textScaleFactor: 0.5,
                  ),
                ),

                60.verticalSpacing,
                Obx(() => controller.loadingController.isLoading
                    ? const CircularProgressIndicator()
                    : PrimaryButton(
                  onTap: () {
                    if (controller.validate()) {
                      Get.toNamed(Routes.SIGN_UP);
                    }
                  },
                  text: 'Login',
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
