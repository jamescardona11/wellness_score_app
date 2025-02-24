import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wellness_score_app/config/assets/app_assets.dart';
import 'package:wellness_score_app/ui/core/theme/theme.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, this.automaticallyImplyLeading = true});

  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    final sizes = context.theme.tokens.sizes;

    return AppBar(
      title: SvgPicture.asset(AppAssets.logo, height: sizes.x5),
      centerTitle: true,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
