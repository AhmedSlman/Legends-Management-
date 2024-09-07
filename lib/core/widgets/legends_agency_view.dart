// import 'package:flutter/material.dart';

// import '../utils/size_config.dart';
// import 'adapte_layout_widget.dart';

// class LegendsAgencyView extends StatefulWidget {
//   const LegendsAgencyView({super.key});

//   @override
//   State<LegendsAgencyView> createState() => _LegendsAgencyViewState();
// }

// class _LegendsAgencyViewState extends State<LegendsAgencyView> {
//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//       key: scaffoldKey,
//       appBar: MediaQuery.sizeOf(context).width < SizeConfig.tablet
//           ? AppBar(
//               elevation: 0,
//               backgroundColor: const Color(0xfffafafa),
//               leading: IconButton(
//                 icon: const Icon(Icons.menu),
//                 onPressed: () {
//                   scaffoldKey.currentState!.openDrawer();
//                 },
//               ),
//             )
//           : null,
//       backgroundColor: const Color(0xfff7f9fA),
//       drawer: MediaQuery.sizeOf(context).width < SizeConfig.tablet
//           ? const CustomDrawer()
//           : null,
//       body: LegendsAgencyWebView()
//     );
//   }
// }