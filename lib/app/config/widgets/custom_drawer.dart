import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamada/app/config/theme.dart';
import 'package:hamada/app/helpers/enums.dart';

class CustomDrawer extends StatelessWidget {
  final Brands brand;
  final ValueChanged<Devices?> onChanged;

  const CustomDrawer({
    super.key,
    required this.brand,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                onChanged(null);
              },
              title: Text(
                'الرئيسية',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            ...Devices.values
                .map(
                  (e) => ListTile(
                    onTap: () {
                      onChanged(e);
                    },
                    hoverColor: Colors.red,
                    title: Text(
                      'صيانة ${e.name.tr} ${brand.name.tr}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                )
                ,
          ],
        ),
      ),
    );
  }
}
