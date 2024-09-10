import 'package:flutter/material.dart';

import '../widgets/welcome_screen_body.dart';

class WelcomeScreenMobile extends StatelessWidget {
  const WelcomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: WelcomeScreenBody(),
    );
  }
}
