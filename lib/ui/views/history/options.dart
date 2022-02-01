import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodsub/utilities/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Option extends StatelessWidget {
  const Option({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            child: Container(
              width: 183,
              height: 35,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                boxShadow: boxShadow,
                color: Colors.white,
              ),
              child: Text('Skip delivery',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(255, 169, 39, 1),
                    fontSize: 12.0,
                  )),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            child: Container(
              width: 183,
              height: 35,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                boxShadow: boxShadow,
                color: Colors.white,
              ),
              child: Text('Change Meals',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(255, 169, 39, 1),
                    fontSize: 12.0,
                  )),
            ),
          ),
        ),
        const SizedBox(height: 2),
        Container(
          width: 44,
          height: 35,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            boxShadow: boxShadow,
            color: Colors.white,
          ),
          child:  PopupMenuButton(
              child: const Icon(Icons.more_vert_outlined,
              color: Color.fromRGBO(255, 169, 39, 1)),
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
            const PopupMenuItem<String>(child: Text('Play meal'), value: 'play'),
            const PopupMenuItem<String>(child: Text('Pause meal'), value: 'pause'),
            const PopupMenuItem<String>(child: Text('Skip meal'), value: 'skip'),
            const PopupMenuItem<String>(child: Text('Change meal'), value: 'change'),
            const PopupMenuItem<String>(child: Text('Stop meal'), value: 'stop'),
            const PopupMenuItem<String>(child: Text('Reschedule meal'), value: 'reschedule'),
          ],
              onSelected: null,
              elevation: 1.0
          )
          //const Icon(Icons.more_vert_outlined,
              //color: Color.fromRGBO(255, 169, 39, 1)),
        )
      ],
    );
  }
}
