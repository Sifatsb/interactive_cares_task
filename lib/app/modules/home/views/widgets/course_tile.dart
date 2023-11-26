import 'package:flutter/material.dart';
import 'package:interactive_cares_task/app/data/constants/app_image.dart';
import 'package:interactive_cares_task/app/utilities/widgets/common_widgets/primary_button.dart';

class CourseTile extends StatelessWidget {
  final String? title;
  final String? description;
  final String? imagePath;
  final Function()? onPressed;

  const CourseTile({
    Key? key,
    this.title,
    this.description,
    this.imagePath,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 1,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                AppImages.thumbnail,
                height: 150,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
            ListTile(
              title: Text(
                title ?? '',
                style: const TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                description ?? '',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: PrimaryButton(
                onTap: onPressed,
                width: 150,
                borderRadius: 5,
                text: 'Continue Course',
              ),

            )
          ],
        ),
      ),
    );
  }
}
