import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../admin/home/data/drawer_item_model.dart';
import '../../../../admin/home/presentation/view/widgets/drawer_item.dart';

class EmployeeDrawerItemsListView extends StatefulWidget {
  final TabController tabController;
  // final ScaffoldState scaffoldState;

  const EmployeeDrawerItemsListView({
    super.key,
    required this.tabController,
    // required this.scaffoldState,
  });

  @override
  State<EmployeeDrawerItemsListView> createState() =>
      _AdminDrawerItemsListViewState();
}

class _AdminDrawerItemsListViewState
    extends State<EmployeeDrawerItemsListView> {
  int activeIndex = 0;

  final List<DrawerItemModel> items = [
    DrawerItemModel(title: 'Dashboard', image: Assets.imagesDashboard),
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
