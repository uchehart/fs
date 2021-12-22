import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/shared/Widgets/colors.dart';
import 'package:foodsub/ui/views/shared/Widgets/style.dart';

class Appbar extends StatelessWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.notification1,
      elevation: 0,
      leading: Expanded(
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
                size: 13,
              ),
            ),
            Text(
              'Back',
              style: AppTextStyles.smallSubtitle,
            )
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_outlined,
            size: 17,
          ),
        )
      ],
    );
  }
}
