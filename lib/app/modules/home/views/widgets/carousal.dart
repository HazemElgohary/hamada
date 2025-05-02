import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hamada/app/helpers/enums.dart';
import 'package:hamada/app/helpers/extentions/enum.dart';

class CustomCarousal extends StatelessWidget {
  final Brands brand;

  const CustomCarousal({
    super.key,
    required this.brand,
  });

  @override
  Widget build(BuildContext context) {
    final list = brand.getImages();
    return list.isEmpty
        ? const SizedBox.shrink()
        : CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
            ),
            items: list.map(
              (e) {
                return SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    e,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ).toList(),
          );
  }
}
