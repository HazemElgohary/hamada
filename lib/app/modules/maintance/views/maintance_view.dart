import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/maintance_controller.dart';

class MaintanceView extends GetView<MaintanceController> {
  const MaintanceView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaintanceView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MaintanceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
