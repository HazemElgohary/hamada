import 'package:get/get.dart';

import '../../../helpers/enums.dart';

class HomeController extends GetxController {
  final scale = 0.0.obs;
  final selectedDevice = Rx<Devices?>(null);
  final selectedBrand = Rx<Brands>(Brands.toshiba);

  final List<String> alexandriaAreas = [
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

  @override
  void onReady() {
    scale.value = 1.0;
    super.onReady();
  }
}
