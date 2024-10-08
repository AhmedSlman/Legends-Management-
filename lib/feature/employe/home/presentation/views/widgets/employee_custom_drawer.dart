import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:legends_management/feature/admin/home/presentation/viewmodel/logoutcubit/logout_cubit.dart';

import '../../../../../../../core/utils/app_images.dart';
import '../../../../../../core/routes/routes_path.dart';
import '../../../../../admin/home/data/drawer_item_model.dart';
import '../../../../../admin/home/presentation/view/widgets/active_and_inactive_item.dart';
import 'employee_drawer_items_list_view.dart';

class EmployeeCustomDrawer extends StatelessWidget {
  final TabController tabController;
  // final ScaffoldState scaffoldState;

  const EmployeeCustomDrawer({
    super.key,
    required this.tabController,
    // required this.scaffoldState,
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

            Navigator.pop(context);
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
            EmployeeDrawerItemsListView(
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
                    onTap: () => context.read<LogoutCubit>().logOut(),
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
      ),
    );
  }
}
