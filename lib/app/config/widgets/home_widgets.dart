import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final String title;
  final bool addDivider;
  final bool reversed;
  final String subTitle;
  final String image;

  const ServiceItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    this.addDivider = false,
    this.reversed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 25,
      ),
      child: Column(
        children: reversed
            ? [
                TitleText(
                  text: title,
                  addDivider: addDivider,
                ),
                SmallText(
                  text: subTitle,
                ),
                const SizedBox(
                  height: 25,
                ),
                DefaultImage(
                  image: image,
                ),
              ]
            : [
                DefaultImage(
                  image: image,
                ),
                const SizedBox(
                  height: 25,
                ),
                TitleText(
                  text: title,
                  addDivider: addDivider,
                ),
                SmallText(
                  text: subTitle,
                ),
              ],
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String text;
  final bool addDivider;

  const TitleText({
    super.key,
    required this.text,
    this.addDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        if (addDivider)
          UnconstrainedBox(
            child: Container(
              width: 100,
              height: 3,
              color: Colors.grey,
            ),
          ),
      ],
    );
  }
}

class SmallText extends StatelessWidget {
  final String text;

  const SmallText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
    );
  }
}

class DefaultImage extends StatelessWidget {
  final String image;
  final bool isLarge;

  const DefaultImage({
    super.key,
    required this.image,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      child: isLarge
          ? Image.asset(
              image,
              fit: BoxFit.cover,
            )
          : SizedBox(
              height: 330,
              width: double.infinity,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}

class AlexAreas extends StatelessWidget {
  final List<String> areas;

  const AlexAreas({super.key, required this.areas});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Wrap(
      children: areas
          .map(
            (e) => SizedBox(
              width: size.width * .35,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.location_pin, color: Colors.red),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(e),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
