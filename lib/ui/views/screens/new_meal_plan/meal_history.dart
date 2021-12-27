import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/shared/Widgets/colors.dart';
import 'package:foodsub/ui/views/shared/Widgets/style.dart';

import 'history_list.dart';

class MealHistory extends StatefulWidget {
  const MealHistory({Key? key}) : super(key: key);

  @override
  State<MealHistory> createState() => _MealHistory();
}

class _MealHistory extends State<MealHistory> {
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
            onPressed: () {},
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
                      'History',
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
                  child: Row(
                    children: [
                      Text('October 11, 2021', style: AppTextStyles.heading2),
                      const Spacer(),
                      const Icon(Icons.autorenew_outlined,
                          size: 20, color: AppColors.black),
                    ],
                  )),
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
                  itemCount: history.length + 1,
                  itemBuilder: (context, index) {
                    if (index == history.length) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 34,
                                  width: 78,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(255, 169, 39, 1),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15.0),
                                        topRight: Radius.circular(15.0),
                                        bottomLeft: Radius.circular(15.0),
                                        bottomRight: Radius.circular(15.0),
                                      )),
                                  child: Text('Load More',
                                      style: AppTextStyles.smallSubtitle
                                          .copyWith(color: Colors.white)),
                                )),
                          ));
                    }
                    return index.isInfinite
                        ? const Text('List Empty')
                        : history.elementAt(index);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
