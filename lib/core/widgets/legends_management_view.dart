import 'package:flutter/material.dart';
import 'package:legends_management/core/widgets/legends_desktop_layout.dart';
import 'package:legends_management/core/widgets/legends_mobile_layout.dart';

import 'adaptive_layout_widget.dart';
import 'legends_tablet_layout.dart';

class LegendsManagementView extends StatefulWidget {
  const LegendsManagementView({super.key});

  @override
  State<LegendsManagementView> createState() => _LegendsManagementViewState();
}

class _LegendsManagementViewState extends State<LegendsManagementView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // appBar: MediaQuery.sizeOf(context).width < SizeConfig.tablet
      //     ? AppBar(
      //         elevation: 0,
      //         backgroundColor: const Color(0xfffafafa),
      //         leading: IconButton(
      //           icon: const Icon(Icons.menu),
      //           onPressed: () {
      //             scaffoldKey.currentState!.openDrawer();
      //           },
      //         ),
      //       )
      //     : null,
      backgroundColor: const Color(0xfff7f9fA),
      // drawer: MediaQuery.sizeOf(context).width < SizeConfig.tablet
      //     ? const CustomDrawer()
      //     : null,
      body: AdaptiveLayout(
        desktopLayout: (context) => const LegendsDesktopLayout(),
        tabletLayout: (context) => const LegendsTabletLayout(),
        mobileLayout: (context) => const LegendsMobileLayout(),
      ),
    );
  }
}
