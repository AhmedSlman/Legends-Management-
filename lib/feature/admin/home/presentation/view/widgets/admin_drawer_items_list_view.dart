import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../data/drawer_item_model.dart';
import 'drawer_item.dart';

class AdminDrawerItemsListView extends StatefulWidget {
  final TabController tabController;
  // final ScaffoldState scaffoldState;

  const AdminDrawerItemsListView({
    super.key,
    required this.tabController,
    // required this.scaffoldState,
  });

  @override
  State<AdminDrawerItemsListView> createState() =>
      _AdminDrawerItemsListViewState();
}

class _AdminDrawerItemsListViewState extends State<AdminDrawerItemsListView> {
  int activeIndex = 0;

  final List<DrawerItemModel> items = [
    DrawerItemModel(title: 'Dashboard', image: Assets.imagesDashboard),
    DrawerItemModel(title: 'Departments', image: Assets.imagesDepartmentswhite),
    DrawerItemModel(title: 'Shifts', image: Assets.imagesShifts),
    // DrawerItemModel(title: 'Teams', image: Assets.imagesTeams),
    // DrawerItemModel(title: 'All tasks', image: Assets.imagesAlltasks),
    // DrawerItemModel(title: 'All Projects', image: Assets.imagesAllprojects),
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
              });
            }
            if (MediaQuery.of(context).size.width < SizeConfig.tablet) {
              Navigator.of(context).pop(); // Close the drawer
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
