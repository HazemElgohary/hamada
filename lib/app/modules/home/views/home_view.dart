import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hamada/app/config/widgets/animated_listview.dart';
import 'package:hamada/app/config/constants.dart';
import 'package:hamada/app/config/theme.dart';
import 'package:hamada/app/config/widgets/call_widget.dart';
import 'package:hamada/app/config/widgets/custom_drawer.dart';
import 'package:hamada/app/config/widgets/default_button.dart';
import 'package:hamada/app/config/widgets/device_item.dart';
import 'package:hamada/app/config/widgets/home_widgets.dart';
import 'package:hamada/app/helpers/enums.dart';
import 'package:hamada/app/helpers/extentions/enum.dart';
import 'package:hamada/app/modules/home/views/widgets/carousal.dart';
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
          () => controller.selectedBrand.value == Brands.zanussi
              ? Image.asset(
                  Asset.images.png.zanussiLogo,
                  fit: BoxFit.fill,
                )
              : Text(
                  controller.selectedBrand.value.name.toUpperCase(),
                  style: context.textTheme.bodyLarge!.copyWith(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: controller.selectedBrand.value.getColor(),
                  ),
                ),
        ),
        centerTitle: true,
      ),
      body: CustomAnimatedListView(
        children: [
          CustomCarousal(brand: controller.selectedBrand.value),
          const SizedBox(
            height: 20,
          ),
          Text(
            'مركز خدمة صيانة ${controller.selectedBrand.value.name.tr}',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 40,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            'اهلا بيكم في الموقع الرسمي لمركز صيانة ${controller.selectedBrand.value.name.tr}',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge!.copyWith(
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
                  color: controller.selectedBrand.value.getColor(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text(
                      'من نحن',
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'أفضل مركز خدمة فى مصر لصيانة اجهزة ${controller.selectedBrand.value.name.tr}, صيانة فورية بالمنزل , يسعدنا استقبال اتصالاتكم من الساعة 8:00 صباحا حتى الساعة 10:00 مساء على الرقم ${Constants.callCenter} لصيانة جميع اجهزة ${controller.selectedBrand.value.name.tr} المنزلية (غسالات وثلاجات وبوتجازات وديب فريزر وشاشات و ميكروويف ) بجميع اشكالها واحجامها ',
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DefaultButton(
                      color: Colors.grey,
                      width: 300,
                      text: 'اتصل بنا',
                      icon: const Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: 20,
                      ),
                      onTap: () {
                        controller.makePhoneCall(Constants.callCenter);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DefaultButton(
                      color: Colors.grey,
                      width: 300,
                      text: Constants.callCenterSecond,
                      icon: const SizedBox.shrink(),
                      onTap: () {
                        controller.makePhoneCall(Constants.callCenter);
                      },
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
            text: 'الاجهزة',
            addDivider: true,
          ),
          DeviceItem(
            title: 'صيانة ثلاجة',
            subTitle:
                'صيانة جميع ثلاجات ${controller.selectedBrand.value.name.tr} بجميع اشكالها واحجامها',
            image: Asset.images.devices.friage,
          ),
          DeviceItem(
            title: 'صيانة غسالات',
            subTitle:
                'صيانة جميع الغسالات ${controller.selectedBrand.value.name.tr} بجميع اشكالها واحجامها',
            image: Asset.images.devices.drier,
          ),
          DeviceItem(
            title: 'صيانة ديب فريزر',
            subTitle:
                'صيانة جميع انواع الديب فريزر ${controller.selectedBrand.value.name.tr} بجميع اشكالها واحجامها',
            image: Asset.images.devices.deep,
          ),
          DeviceItem(
            title: 'صيانة غسالات فوق اتوماتيك ',
            subTitle:
                'صيانة جميع الغسالات ${controller.selectedBrand.value.name.tr} بجميع اشكالها واحجامها',
            image: Asset.images.devices.auto,
          ),
          DeviceItem(
            title: 'صيانة غسالات الاطباق',
            subTitle:
                ' صيانة جميع الغسالات الاطباق ${controller.selectedBrand.value.name.tr} بجميع اشكالها واحجامها',
            image: Asset.images.devices.tae,
          ),
          DeviceItem(
            title: 'صيانة ميكروويف',
            subTitle:
                'صيانة جميع انواع الميكروويف ${controller.selectedBrand.value.name.tr} بجميع اشكالها واحجامها',
            image: Asset.images.devices.micro,
          ),
          if (controller.selectedBrand.value == Brands.zanussi)
            DeviceItem(
              title: 'صيانة بوتجازات',
              subTitle: 'صيانة جميع بوتجازات ${controller.selectedBrand.value.name.tr} بكل انواعها',
              image: Asset.images.zanossi.zanussiBotogas,
            )
          else
            DeviceItem(
              title: 'صيانة شاشات',
              subTitle: 'صيانة جميع الشاشات ${controller.selectedBrand.value.name.tr} بكل انواعها',
              image: Asset.images.devices.tv,
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
          // ServiceItem(
          //   title: 'ضمان لمدة عام',
          //   subTitle:
          //       'لاننا نثق في خدمتنا وفي قطع الغيار التي نستخدمها نعطي لعميلنا ضمان لمدة عام على ما قمنا به',
          //   image: Asset.images.png.serv1,
          // ),
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
                      style: context.textTheme.bodyLarge!.copyWith(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: DefaultButton(
                        color: controller.selectedBrand.value.getColor(),
                        text: 'اتصل بنا',
                        onTap: () {
                          controller.makePhoneCall(Constants.callCenter);
                        },
                        icon: const SizedBox.shrink(),
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
      floatingActionButton: CallWidget(
        onPhoneTap: () {
          controller.makePhoneCall(Constants.callCenter);
        },
        onWhatsTap: () {
          controller.goToWhats(Constants.callCenter);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      extendBody: true,
    );
  }
}
