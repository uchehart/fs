import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/screens/notification/notification_screen.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/shared/images.dart';
import 'package:foodsub/ui/views/shared/style.dart';

class ViewMealPlanScreen extends StatelessWidget {
  const ViewMealPlanScreen({Key? key}) : super(key: key);
  static const routeName = "/viewMealPlan";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.ash),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  NotificationScreen.routeName,
                );
              },
              icon: const Icon(
                CupertinoIcons.bell,
                color: AppColors.ash,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Today’s Plan ',
                    style: AppTextStyles.heading2,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.more_vert_outlined,
                      size: 14, color: AppColors.black),
                  const Spacer(),
                  Container(
                    width: 86,
                    height: 25,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColors.notification1,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Text(
                      'See full plan',
                      style: AppTextStyles.smallSubtitle,
                    ),
                  )
                ],
              ),
              Text(
                'Dec. 4, 2021',
                style: AppTextStyles.smallSubtitle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 24),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Color(0xffFFF4E4)),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(),
                  ),
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // margin: EdgeInsets.symmetric(vertical: ),
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            image: DecorationImage(
                              image: AssetImage(launch),
                            )),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Egg Sauce",
                            style: AppTextStyles.smallSubtitle,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Breakfast  Time  07:30",
                            style: AppTextStyles.smallText
                                .copyWith(fontWeight: FontWeight.w200),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(
                                Icons.play_circle_outline,
                                size: 14,
                              ),
                              Icon(
                                Icons.pause_circle_outline,
                                size: 14,
                              ),
                              Icon(
                                Icons.alarm_off,
                                size: 14,
                              ),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      const Icon(Icons.more_vert_outlined),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
