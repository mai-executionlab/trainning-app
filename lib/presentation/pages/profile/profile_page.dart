import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/presentation/theme/colors.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 50,
                  color: AppColors.grey,
                ),
                Positioned(child: SvgPicture.asset('assets/icons/menu.svg'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
