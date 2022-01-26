import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/history/model/history_meal_model.dart';
import 'package:foodsub/ui/views/history/view_model/meal_model.dart';
import 'package:foodsub/ui/views/shared/Widgets/meal_list.dart';
import 'package:foodsub/utilities/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class MealCard extends StatelessWidget {
  const MealCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //MealModel? list;
    return Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: mealList
            .map(
              (item) => Container(
                height: 209,
                width: 164,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: boxShadow,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          item.img,
                          height: 93,
                          width: 103,
                        ),
                      ),
                      Text(
                        item.mealname,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(69, 68, 68, 1),
                          fontSize: 12.0,
                        ),
                      ),
                      Text(item.additional,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(69, 68, 68, 1),
                            fontSize: 12.0,
                          )),
                      Container(
                        height: 20,
                        width: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1,
                            color: const Color.fromRGBO(191, 191, 191, 1),
                          ),
                        ),
                        child: Text(item.number,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(69, 68, 68, 1),
                              fontSize: 12.0,
                            )),
                      )
                    ],
                  ),
                ),
              ),
            )
            .toList());
  }
}
