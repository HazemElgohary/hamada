import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/inject.dart';
import 'app/routes/app_pages.dart';

import 'package:flutter/gestures.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/config/translate/messages.dart';

Future<void> main() async {
  await inject();
  runApp(
    GetMaterialApp(
      title: "الوطنية للصيانة",
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      locale: const Locale('ar'),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      translations: Messages(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      fallbackLocale: const Locale('en'),
    ),
  );
}
