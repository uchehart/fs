import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodsub/models/notification.dart';
import 'package:foodsub/ui/views/screens/notification/notifications.dart';
import 'package:foodsub/utilities/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:foodsub/ui/views/shared/colors.dart';

class NotificationTile extends StatefulWidget {
  const NotificationTile({Key? key}) : super(key: key);

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  @override
  Widget build(BuildContext context) {
    //Notification will be sort later base on time receieved
    return GroupedListView<Info, String>(
      physics: bouncingScrollPhysics,
      shrinkWrap: true,
      elements: notificationList,
      groupBy: (Info element) => element.sort!,
      groupComparator: (value1, value2) => value2.compareTo(value1),
      // itemComparator: (Info element1, Info element2) =>
      //     element1.time!.compareTo(element2.time!),
      //useStickyGroupSeparators:
      order: GroupedListOrder.DESC,
      groupSeparatorBuilder: (String value) => Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
          child: Text(
            value,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              color: AppColors.ash,
              fontSize: 20.0,
            ),
          )),
      itemBuilder: (context, element) {
        return Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: element.view == false
                    ? const Color.fromRGBO(255, 236, 197, 1)
                    : Colors.transparent,
                border: Border(
                    bottom:
                        element.notification?.indexOf(element.notification!) ==
                                element.notification!.length - 1
                            ? const BorderSide(
                                color: Color.fromRGBO(69, 68, 68, 0.3))
                            : const BorderSide(color: Colors.transparent),
                    top: const BorderSide(
                        color: Color.fromRGBO(69, 68, 68, 0.3)))),
            child: ListTile(
              leading: Container(
                width: 41,
                height: 41,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(element.img!), fit: BoxFit.fill)),
              ),
              title: Text(
                element.notification!,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400,
                  color: AppColors.ash,
                  fontSize: 12.0,
                ),
              ),
              subtitle: Text(
                element.time!,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400,
                  color: AppColors.ash,
                  fontSize: 12.0,
                ),
              ),
            ));
      },
    );
  }
}
