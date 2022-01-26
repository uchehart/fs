import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import 'history_body.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);
  static const routeName = "/historyscreen";

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
                    title: Text(
                      "History",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: AppColors.ash,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  body: const HistoryBody()
                )));
  }
}
