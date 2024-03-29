import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/shared/images.dart';
import 'package:google_fonts/google_fonts.dart';

class SideBarTop extends StatelessWidget {
  const SideBarTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 186,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: AppColors.orange,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          )),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 215, 215, 1),
              image: const DecorationImage(
                  image: AssetImage(avatar), fit: BoxFit.fill),
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: Colors.white)),
        ),
        title: Text(
          'Sammy Lembi',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        subtitle: Text(
          'leembisam@gmail.com',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        trailing: GestureDetector(
          child: const Icon(
            Icons.cancel_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
