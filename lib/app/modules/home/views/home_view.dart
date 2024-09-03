import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hamada/app/config/widgets/animated_listview.dart';
import 'package:hamada/app/config/constants.dart';
import 'package:hamada/app/config/theme.dart';
import 'package:hamada/app/config/widgets/call_widget.dart';
import 'package:hamada/app/config/widgets/custom_drawer.dart';
import 'package:hamada/app/config/widgets/default_button.dart';
import 'package:hamada/app/config/widgets/home_widgets.dart';
import 'package:hamada/app/helpers/enums.dart';
import 'package:hamada/generated/assets.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.grey[200],
        title: Obx(
          () => Text(
            controller.selectedBrand.value.name.toUpperCase(),
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
        centerTitle: false,
      ),
      body: CustomAnimatedListView(
        children: [
          Text(
            'مركز خدمة صيانة ${controller.selectedBrand.value.name.tr} بالاسكندرية',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 40,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'قطع غيار اصليه, ضمان عام على الصيانه, نصلك بنفس اليوم ثلاجات, ديب فريزر, وغسالات وشاشات و ميكروويف',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Obx(
            () => AnimatedScale(
              scale: controller.scale.value,
              duration: Constants.defaultDuration,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                child: SizedBox(
                  height: 330,
                  width: double.infinity,
                  child: Image.asset(Asset.images.png.hero, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Obx(
            () => AnimatedScale(
              scale: controller.scale.value,
              duration: Constants.defaultDuration,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const Text(
                      'من نحن',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'أفضل مركز خدمة فى مصر لصيانة اجهزة ${controller.selectedBrand.value.name.tr}, صيانة فورية بالمنزل وضمان عام علي قطع الغيار الاصلية, يسعدنا استقبال اتصالاتكم من الساعة 8:00 صباحا حتى الساعة 10:00 مساء على الرقم ${Constants.callCenter} لصيانة جميع اجهزة ${controller.selectedBrand.value.name.tr} المنزلية (ثلاجات وبوتجازات وديب فريزر وغسالات وشاشات و ميكروويف )',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const DefaultButton(
                      color: Colors.grey,
                      width: 300,
                      text: 'اتصل بنا',
                      icon: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const DefaultButton(
                      color: Colors.grey,
                      width: 300,
                      text: Constants.callCenter,
                      icon: SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const TitleText(
            text: 'اهم مميزاتنا',
            addDivider: true,
          ),
          ServiceItem(
            title: 'خدمة فورية',
            subTitle: 'لأننا لنسعى دائماً ان نكون متواجدين بجانب عملائنا بصفة مستمرة',
            image: Asset.images.png.serv12,
          ),
          ServiceItem(
            title: 'صيانة بالمنزل',
            subTitle: 'حرصا منا على راحة بال العميل تتم جميع أعمال الصيانة بالمنزل دون نقل الجهاز',
            image: Asset.images.png.serv3,
          ),
          ServiceItem(
            title: 'قطع غيار اصلية',
            subTitle: 'نحن نستعمل في صيانتنا قطع الغيار الاصلية لجميع الاجهزة',
            image: Asset.images.png.serv8,
          ),
          ServiceItem(
            title: 'ضمان لمدة عام',
            subTitle:
                'لاننا نثق في خدمتنا وفي قطع الغيار التي نستخدمها نعطي لعميلنا ضمان لمدة عام على ما قمنا به',
            image: Asset.images.png.serv1,
          ),
          ServiceItem(
            title: 'نغطي الاسكندرية',
            subTitle: 'لدينا اسطول من افضل المهندسين وامهر الفنيين يغطي محافظة الاسكندرية بالكامل',
            image: Asset.images.png.serv10,
          ),
          Stack(
            children: [
              DefaultImage(
                image: Asset.images.png.serv22,
              ),
              Container(
                height: 330,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: AppColors.blackColor.withOpacity(.4),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'اتصل الان على رقم صيانة ${controller.selectedBrand.value.name.tr} العربي و ستجدنا امامك لاصلاح جهازك',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: DefaultButton(
                        color: Colors.red,
                        text: 'اتصل بنا',
                        icon: SizedBox.shrink(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ServiceItem(
            title: 'المناطق',
            subTitle: 'نغطي جميع مناطق الاسكندرية',
            addDivider: true,
            reversed: true,
            image: Asset.images.png.locations,
          ),
          AlexAreas(
            areas: controller.alexandriaAreas,
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
      endDrawer: CustomDrawer(
        brand: Brands.toshiba,
        onChanged: (value) => controller.selectedDevice.value = value,
      ),
      bottomNavigationBar: const CallWidget(),
      extendBody: true,
    );
  }
}
