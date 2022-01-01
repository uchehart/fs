import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/shared/style.dart';

class NotificationTile extends StatelessWidget {
  final String? imgPath;
  final String? notification;
  final String? time;
  final bool? view;

  const NotificationTile({
    Key? key,
    this.imgPath,
    this.notification,
    this.time,
    this.view,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: view == false
              ? const Color.fromRGBO(255, 236, 197, 1)
              : Colors.transparent,
          border: const Border(
              bottom: BorderSide(color: AppColors.ash),
              top: BorderSide(color: AppColors.ash))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 41,
              height: 41,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(imgPath!), fit: BoxFit.fill)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notification!, style: AppTextStyles.smallSubtitle),
                  Text(time!, style: AppTextStyles.smallSubtitle),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
