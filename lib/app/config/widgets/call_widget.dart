import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'default_button.dart';

class CallWidget extends StatelessWidget {
  const CallWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ),
      child: Row(
        children: [
          Expanded(
            child: DefaultButton(
              color: Colors.red,
              text: 'اتصل بنا',
              icon: FaIcon(
                FontAwesomeIcons.phone,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: DefaultButton(
              color: Colors.green,
              text: 'كلمنا واتس',
              icon: FaIcon(
                FontAwesomeIcons.whatsapp,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
