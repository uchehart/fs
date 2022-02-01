import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/history/view_model/meal_model.dart';
import 'package:foodsub/utilities/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'meal_card.dart';
import 'options.dart';

class HistoryBody extends StatelessWidget{
  const HistoryBody({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //final contr = BodyModel();
    //const Option()
    return SingleChildScrollView(
        physics: bouncingScrollPhysics,
        child: Column(
            children: scheduleList.map((index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Container(
                        height: 107,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: boxShadow,
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      index.date,
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(
                                            69, 68, 68, 1),
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.calendar_today_outlined,
                                      size: 15,
                                    ),
                                  ]),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    index.mealNum,
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          69, 68, 68, 1),
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  Text(
                                    'Scheduled',
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          69, 68, 68, 1),
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 0.5,
                                color: Color.fromRGBO(133, 133, 133, 0.3),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                index.lastEdit,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  color:
                                  const Color.fromRGBO(69, 68, 68, 1),
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0,),
                    child: MealCard(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Option(),
                  const SizedBox(height: 10)
                ]),
                ).toList(),
                ));
  }

}