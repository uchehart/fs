import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/screens/new_meal_plan/list.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/shared/style.dart';

import 'meal_history.dart';

class TodayMeal extends StatefulWidget {
  const TodayMeal({Key? key}) : super(key: key);

  @override
  State<TodayMeal> createState() => _TodayMeal();
}

class _TodayMeal extends State<TodayMeal> {
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
          "Back",
          style: AppTextStyles.heading1,
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MealHistory())),
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: AppColors.black,
              size: 17,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20, top: 15.0, bottom: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  children: [
                    Text(
                      "Today's Plan",
                      style: AppTextStyles.heading1,
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
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                          )),
                      child: Text(
                        'See full plan',
                        style: AppTextStyles.smallSubtitle,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text('Dec 4, 2021', style: AppTextStyles.heading2)),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: AppColors.notification1,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    )),
                child: ListView.builder(
                  itemCount: meals.length + 1,
                  itemBuilder: (context, index) {
                    if (index == meals.length) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 39,
                            width: 39,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.orange,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0),
                                  bottomLeft: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0),
                                )),
                            child: const Icon(
                              Icons.add_outlined,
                              color: AppColors.orange,
                              size: 20,
                            ),
                          ),
                        )),
                      );
                    }
                    return index.isInfinite
                        ? const Text('List Empty')
                        : meals.elementAt(index);
                  },
                  // separatorBuilder: (BuildContext context, int index) {
                  //   return index == 0
                  //       ? const SizedBox.shrink()
                  //       : index == meals.length - 1
                  //           ? GestureDetector(
                  //               child: Container(
                  //               decoration: BoxDecoration(
                  //                   border: Border.all(
                  //                     color: Colors.black,
                  //                   ),
                  //                   borderRadius: const BorderRadius.only(
                  //                     topLeft: Radius.circular(15.0),
                  //                     topRight: Radius.circular(15.0),
                  //                     bottomLeft: Radius.circular(15.0),
                  //                     bottomRight: Radius.circular(15.0),
                  //                   )),
                  //               child: const Icon(
                  //                 Icons.add_outlined,
                  //                 color: Colors.black,
                  //                 size: 14,
                  //               ),
                  //             ))
                  //           : const SizedBox.shrink();
                  // },
                ),
                // const Divider(
                //   thickness: 2,
                // )
              )
            ],
          ),
        ),
      ),
    );
  }
}
