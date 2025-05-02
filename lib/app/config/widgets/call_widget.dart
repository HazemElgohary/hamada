import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'default_button.dart';

class CallWidget extends StatelessWidget {
  final VoidCallback onPhoneTap;
  final VoidCallback onWhatsTap;

  const CallWidget({
    super.key,
    required this.onPhoneTap,
    required this.onWhatsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: onPhoneTap,
            child: const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.phone,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: onWhatsTap,
            child: const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(
                FontAwesomeIcons.whatsapp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
