import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wellness_score_app/config/assets/app_assets.dart';
import 'package:wellness_score_app/ui/core/theme/theme.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sizes = context.sizes;

    return AppBar(
      title: Hero(
        tag: 'app_logo',
        child: SvgPicture.asset(AppAssets.logo, height: sizes.x5),
      ),
      automaticallyImplyLeading: false,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
