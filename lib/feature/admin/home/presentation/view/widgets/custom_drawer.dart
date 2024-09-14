import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_images.dart';
import '../../../data/drawer_item_model.dart';
import 'active_and_inactive_item.dart';
import 'drawer_items_list_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .7,
      color: Color.fromARGB(255, 26, 24, 32),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 8,
            ),
          ),
          const DrawerItemsListView(),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const Expanded(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                InActiveDrawerItem(
                  drawerItemModel: DrawerItemModel(
                      title: 'Setting system', image: Assets.imagesSettings),
                ),
                InActiveDrawerItem(
                  drawerItemModel: DrawerItemModel(
                      title: 'Logout account', image: Assets.imagesLogout),
                ),
                const SizedBox(
                  height: 48,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
