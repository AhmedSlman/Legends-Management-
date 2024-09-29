import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/app_styles.dart';
import '../../../data/drawer_item_model.dart';

class InActiveDrawerItem extends StatelessWidget {
  const InActiveDrawerItem({
    super.key,
    required this.drawerItemModel,
  });

  final DrawerItemModel drawerItemModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(drawerItemModel.image),
      title: FittedBox(
        alignment: AlignmentDirectional.centerStart,
        fit: BoxFit.scaleDown,
        child: Text(
          drawerItemModel.title,
          style: AppStyles.styleRegular24(context),
        ),
      ),
    );
  }
}

class ActiveDrawerItem extends StatelessWidget {
  const ActiveDrawerItem({
    super.key,
    required this.drawerItemModel,
  });

  final DrawerItemModel drawerItemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: ListTile(
        leading: SvgPicture.asset(drawerItemModel.image),
        title: Text(
          drawerItemModel.title,
          style: AppStyles.styleRegular24(context),
        ),
        trailing: Container(
          width: 3.27,
          decoration: const BoxDecoration(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
