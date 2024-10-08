import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:legends_management/core/routes/routes_path.dart';
import 'package:legends_management/feature/admin/home/presentation/viewmodel/logoutcubit/logout_cubit.dart';

import '../../../../../../core/utils/app_images.dart';
import '../../../data/drawer_item_model.dart';
import 'active_and_inactive_item.dart';
import 'admin_drawer_items_list_view.dart';

class AdminCustomDrawer extends StatelessWidget {
  final TabController tabController;

  const AdminCustomDrawer({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .7,
      color: const Color.fromARGB(255, 26, 24, 32),
      child: BlocListener<LogoutCubit, LogoutState>(
        listener: (context, state) {
          if (state is LogoutLoading) {
            // Show a loading indicator (optional)
            showDialog(
              context: context,
              builder: (_) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is LogoutSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content:
                      Text('Logout Succeeded: ${state.logoutModel.message}')),
            );
            GoRouter.of(context).go(RoutesPath.kWelcomeView);
          } else if (state is LogoutFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Logout Failed: ${state.errMsg}')),
            );
          }
        },
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
                    // Add an onTap to call the logout function
                    onTap: () => context.read<LogoutCubit>().logOut(),
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
