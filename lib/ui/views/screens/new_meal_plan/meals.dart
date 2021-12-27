import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/shared/Widgets/colors.dart';
import 'package:foodsub/ui/views/shared/Widgets/images.dart';
import 'package:foodsub/ui/views/shared/Widgets/style.dart';

class Meals extends StatefulWidget {
  const Meals({
    Key? key,
  }) : super(key: key);

  @override
  State<Meals> createState() => _Meals();
}

class _Meals extends State<Meals> with SingleTickerProviderStateMixin {
  Map<String, bool> values = {
    'Egg': true,
    'Onion': false,
    'Salt': true,
    'Tomatoes': true,
    'Tatashe': false,
    'Green Pepper': true,
    'Milk': false,
    'Pepper': false,
  };
  TabController? controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
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
            child: Column(
              children: [
                Container(
                  height: 308,
                  width: 366,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  )),
                  child: Image.asset(breakFast2),
                ),
                Row(
                  children: [
                    Text('Egg Sauce', style: AppTextStyles.heading2),
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
                        'Breakfast',
                        style: AppTextStyles.smallSubtitle,
                      ),
                    )
                  ],
                ),
                TabBar(
                  indicatorColor: Colors.transparent,
                  controller: controller,
                  unselectedLabelColor: Colors.black,
                  labelColor: AppColors.notification1,
                  tabs: const [
                    Tab(text: 'Description'),
                    Tab(
                      text: 'Ingredients',
                    ),
                    Tab(
                      text: 'Nutritional Value',
                    )
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Egg sauce is a dish, that is fried in a frying pan and '
                              'mixed with several ingriedients like vegetables of'
                              ' preference',
                              style: AppTextStyles.smallSubtitle,
                              textAlign: TextAlign.start),
                          Text('Preference',
                              style: AppTextStyles.subtitle,
                              textAlign: TextAlign.start),
                          Text(
                              'Others - No pepper and onions in the egg sauce.',
                              style: AppTextStyles.subtitle,
                              textAlign: TextAlign.start),
                        ],
                      ),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Expanded(
                                child: CheckboxListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: Text('Egg',
                                        style: AppTextStyles.smallSubtitle),
                                    value: values['Egg'],
                                    onChanged: (bool? val) {
                                      setState(() {
                                        values['Egg'] = val!;
                                      });
                                    }),
                              ),
                              Expanded(
                                child: CheckboxListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: Text('Tatashe',
                                        style: AppTextStyles.smallSubtitle),
                                    value: values['Tatashe'],
                                    onChanged: (bool? val) {
                                      setState(() {
                                        values['Tatashe'] = val!;
                                      });
                                    }),
                              )
                            ]),
                            Row(children: [
                              Expanded(
                                child: CheckboxListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: Text('Onion',
                                        style: AppTextStyles.smallSubtitle),
                                    value: values['Onion'],
                                    onChanged: (bool? val) {
                                      setState(() {
                                        values['Onion'] = val!;
                                      });
                                    }),
                              ),
                              Expanded(
                                child: CheckboxListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: Text('Green Pepper',
                                        style: AppTextStyles.smallSubtitle),
                                    value: values['Green Pepper'],
                                    onChanged: (bool? val) {
                                      setState(() {
                                        values['Green Pepper'] = val!;
                                      });
                                    }),
                              )
                            ]),
                            Row(children: [
                              Expanded(
                                child: CheckboxListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: Text('Salt',
                                        style: AppTextStyles.smallSubtitle),
                                    value: values['Salt'],
                                    onChanged: (bool? val) {
                                      setState(() {
                                        values['Salt'] = val!;
                                      });
                                    }),
                              ),
                              Expanded(
                                child: CheckboxListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: Text('Milk',
                                        style: AppTextStyles.smallSubtitle),
                                    value: values['Milk'],
                                    onChanged: (bool? val) {
                                      setState(() {
                                        values['Milk'] = val!;
                                      });
                                    }),
                              )
                            ]),
                            Row(children: [
                              Expanded(
                                child: CheckboxListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: Text('Tomatoes',
                                        style: AppTextStyles.smallSubtitle),
                                    value: values['Tomatoes'],
                                    onChanged: (bool? val) {
                                      setState(() {
                                        values['Tomatoes'] = val!;
                                      });
                                    }),
                              ),
                              Expanded(
                                child: CheckboxListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: Text('Pepper',
                                        style: AppTextStyles.smallSubtitle),
                                    value: values['Pepper'],
                                    onChanged: (bool? val) {
                                      setState(() {
                                        values['Pepper'] = val!;
                                      });
                                    }),
                              )
                            ]),
                          ],
                        ),
                      ),
                      ListView(
                        children: [
                          const Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                          Row(
                            children: [
                              Text('Cabohydrate',
                                  style: AppTextStyles.smallSubtitle),
                              const Spacer(),
                              Text('26kg', style: AppTextStyles.smallSubtitle)
                            ],
                          ),
                          Row(
                            children: [
                              Text('Protein',
                                  style: AppTextStyles.smallSubtitle),
                              const Spacer(),
                              Text('25.5kg', style: AppTextStyles.smallSubtitle)
                            ],
                          ),
                          Row(
                            children: [
                              Text('Sodium',
                                  style: AppTextStyles.smallSubtitle),
                              const Spacer(),
                              Text('18%*', style: AppTextStyles.smallSubtitle)
                            ],
                          ),
                          Row(
                            children: [
                              Text('Potassium',
                                  style: AppTextStyles.smallSubtitle),
                              const Spacer(),
                              Text('5%*', style: AppTextStyles.smallSubtitle)
                            ],
                          ),
                          Text('Vitamin A, B3 and C',
                              style: AppTextStyles.smallSubtitle),
                          const Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                fire,
                                width: 11,
                                height: 11,
                              ),
                              Text('153 cal',
                                  style: AppTextStyles.smallSubtitle),
                              const Spacer(),
                              Text('*Daily value',
                                  style: AppTextStyles.smallSubtitle)
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('Additions', style: AppTextStyles.subtitle),
                          const SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                sausage,
                                width: 68,
                                height: 49,
                              ),
                              const Spacer(),
                              Container(
                                height: 31,
                                width: 31,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(228, 239, 255, 1),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.watch_later_outlined,
                                    size: 16, color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Sausages',
                                  style: AppTextStyles.smallSubtitle),
                              const Spacer(),
                              Text('15mins',
                                  style: AppTextStyles.smallSubtitle),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
