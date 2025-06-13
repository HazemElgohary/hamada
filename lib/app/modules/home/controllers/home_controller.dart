import 'package:get/get.dart';
import 'package:hamada/app/helpers/extentions/string.dart';
import 'package:hamada/generated/assets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../helpers/enums.dart';

class HomeController extends GetxController {
  final scale = 0.0.obs;
  final selectedDevice = Rx<Devices?>(null);
  final selectedBrand = Rx<Brands>(Brands.zanussi);

  final alexandriaAreas = <String>[
    'الشاطبي',
    'كامب شيزار',
    'محطة الرمل',
    'المنشية',
    'بحري',
    'المنتزه',
    'المندرة',
    'سيدي بشر',
    'العصافرة',
    'السيوف',
    'باكوس',
    'القباري',
    'الورديان',
    'كرموز',
    'برج العرب',
    'أبو تلات',
    'البيطاش',
    'الدخيلة',
    'الهانوفيل',
    'ك21',
    'العامرية',
    'محرم بك',
    'سموحة',
    'سيدي جابر',
    'الإبراهيمية',
    'جليم',
    'سان ستيفانو',
    'لوران',
  ];

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> goToWhats(String phoneNumber) async {
    final Uri launchUri = Uri.parse('https://wa.me/+02$phoneNumber');
    await launchUrl(launchUri);
  }

  @override
  void onReady() {
    scale.value = 1.0;
    super.onReady();
  }

  @override
  void onInit() {
    selectedBrand.value = Get.routing.current.getBrand();
    super.onInit();
  }
}
