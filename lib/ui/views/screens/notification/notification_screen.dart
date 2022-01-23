import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodsub/ui/views/screens/notification/notification_tile.dart';
import 'package:foodsub/ui/views/screens/notification/notifications.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  static const routeName = "/notification";

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = ChangeNotifier();
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) => Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: AppColors.ash),
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Text(
                "Notifications",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  color: AppColors.ash,
                  fontSize: 18.0,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        notificationList.clear();
                      });
                    },
                    child: Text(
                      'Clear All',
                      style: GoogleFonts.montserrat(
                          color: AppColors.ash, fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
            body: const NotificationTile(),
          ),
        ));
  }
}
