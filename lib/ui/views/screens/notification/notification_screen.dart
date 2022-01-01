import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/screens/notification/notifications.dart';
import 'package:foodsub/ui/views/shared/Widgets/colors.dart';
import 'package:foodsub/ui/views/shared/Widgets/style.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 14,
            color: AppColors.black,
          ),
        ),
        title: Text(
          "Notifications",
          style: AppTextStyles.heading1,
        ),
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                'Clear All',
                style: AppTextStyles.heading3,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              child: Text(
                'Recent',
                style: AppTextStyles.heading2,
              ),
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: notification.length,
                itemBuilder: (context, index) {
                  return index.isInfinite
                      ? const Text('Notification empty')
                      : notification.elementAt(index);
                }),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              child: Text(
                'Yesterday',
                style: AppTextStyles.heading2,
              ),
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: yesterdayNoti.length,
                itemBuilder: (context, index) {
                  return index.isInfinite
                      ? const Text('Notification empty')
                      : yesterdayNoti.elementAt(index);
                }),
          ],
        ),
      ),
    );
  }
}
