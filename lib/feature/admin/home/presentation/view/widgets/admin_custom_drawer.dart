import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_images.dart';
import '../../../data/drawer_item_model.dart';
import 'active_and_inactive_item.dart';
import 'admin_drawer_items_list_view.dart';

class AdminCustomDrawer extends StatelessWidget {
  final TabController tabController;
  // final ScaffoldState scaffoldState;

  const AdminCustomDrawer({
    super.key,
    required this.tabController,
    // required this.scaffoldState,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .7,
      color: const Color.fromARGB(255, 26, 24, 32),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(height: 8),
          ),
          SliverToBoxAdapter(
            child: Image.asset(
              Assets.imagesLogo,
              width: 171,
              height: 99,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 8),
          ),
          AdminDrawerItemsListView(
            tabController: tabController,
            // scaffoldState: scaffoldState,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const Expanded(child: SizedBox(height: 20)),
                InActiveDrawerItem(
                  drawerItemModel: DrawerItemModel(
                    title: 'Setting system',
                    image: Assets.imagesSettings,
                  ),
                ),
                InActiveDrawerItem(
                  drawerItemModel: DrawerItemModel(
                    title: 'Logout account',
                    image: Assets.imagesLogout,
                  ),
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
