import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodsub/ui/views/screens/notification/notifications.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/utilities/constants.dart';
import 'package:foodsub/utilities/exts.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  static const routeName = "/notification";

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
                    onTap: () {},
                    child: Text(
                      'Clear All',
                      style: GoogleFonts.montserrat(
                        color: AppColors.ash,
                      ),
                    ),
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              physics: bouncingPhysics,
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
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: AppColors.ash,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  context.heightBox(16),
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
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: AppColors.ash,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  context.heightBox(16),
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
          ),
        ));
  }
}
