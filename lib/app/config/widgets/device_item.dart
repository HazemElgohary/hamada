import 'package:flutter/material.dart';
import 'package:hamada/app/config/widgets/home_widgets.dart';

class DeviceItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;

  const DeviceItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 25,
      ),
      child: Column(
        children: [
          TitleText(
            text: title,
            addDivider: false,
          ),
          DefaultImage(
            image: image,
            isLarge: true,
          ),
          const SizedBox(
            height: 20,
          ),
          SmallText(
            text: subTitle,
          ),
        ],
      ),
    );
  }
}
