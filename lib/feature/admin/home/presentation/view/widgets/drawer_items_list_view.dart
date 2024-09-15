import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../data/drawer_item_model.dart';
import 'drawer_item.dart';

class DrawerItemsListView extends StatefulWidget {
  final TabController tabController;
  // final ScaffoldState scaffoldState;

  const DrawerItemsListView({
    super.key,
    required this.tabController,
    // required this.scaffoldState,
  });

  @override
  State<DrawerItemsListView> createState() => _DrawerItemsListViewState();
}

class _DrawerItemsListViewState extends State<DrawerItemsListView> {
  int activeIndex = 0;

  final List<DrawerItemModel> items = [
    DrawerItemModel(title: 'Dashboard', image: Assets.imagesDashboard),
    DrawerItemModel(title: 'Departments', image: Assets.imagesDepartments),
    DrawerItemModel(title: 'Shifts', image: Assets.imagesShifts),
    DrawerItemModel(title: 'Teams', image: Assets.imagesTeams),
    DrawerItemModel(title: 'All tasks', image: Assets.imagesAlltasks),
    DrawerItemModel(title: 'All Projects', image: Assets.imagesAllprojects),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (activeIndex != index) {
              setState(() {
                activeIndex = index;
                widget.tabController.animateTo(index);

                // Close the drawer if on mobile
                // if (MediaQuery.sizeOf(context).width < SizeConfig.tablet) {
                //   widget.scaffoldState.closeDrawer();
                // }
              });
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: DrawerItem(
              isActive: activeIndex == index,
              drawerItemModel: items[index],
            ),
          ),
        );
      },
    );
  }
}
