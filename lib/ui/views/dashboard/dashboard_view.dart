import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodsub/ui/views/dashboard/dashboard_controller.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/subscription/subscribe_view.dart';
import 'package:foodsub/utilities/constants.dart';
import 'package:foodsub/utilities/exts.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  static const routeName = "/subscribe";

  @override
  Widget build(BuildContext context) {
    final controller = DashboardController.instance;
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
            leading: Padding(
              padding: EdgeInsets.only(left: context.width(20)),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.dashboard_outlined,
                  color: AppColors.ash,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: context.width(20)),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.bell,
                    color: AppColors.ash,
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(32.0, 24.0, 32.0, 16.0),
            physics: bouncingPhysics,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, ${dummyUserName.split(" ").first}!",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: AppColors.ash,
                    fontSize: 20.0,
                  ),
                ),
                context.heightBox(16),
                Text(
                  "What do you want to order today?",
                  style: GoogleFonts.montserrat(color: AppColors.ash),
                ),
                context.heightBox(24),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: AppColors.orange,
                  ),
                  height: context.height(180),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: context.height(56),
                        left: context.width(20),
                        child: Text(
                          "Current Balance",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: context.width(20),
                        bottom: context.height(56),
                        child: Text(
                          "$dummyNumberOfMealsLeft Meals Left",
                          style: GoogleFonts.montserrat(color: Colors.white),
                        ),
                      ),
                      Positioned(
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromRGBO(255, 182, 74, 0.7),
                          radius: context.width(28),
                        ),
                        bottom: context.height(20),
                        right: context.width(20),
                      ),
                      Positioned(
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromRGBO(255, 182, 74, 0.7),
                          radius: context.width(20),
                        ),
                        right: context.width(80),
                        top: context.height(20),
                      ),
                      Positioned(
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromRGBO(255, 182, 74, 0.7),
                          radius: context.width(10),
                        ),
                        right: context.width(124),
                        top: context.height(88),
                      ),
                    ],
                  ),
                ),
                context.heightBox(24),
                Text(
                  "Today's Deliveries",
                  style: GoogleFonts.montserrat(color: AppColors.ash),
                ),
                context.heightBox(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (final image in controller.deliveryImages)
                      Container(
                        width: context.width(56),
                        height: context.width(56),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
                context.heightBox(24),
                ListView.separated(
                  physics: bouncingPhysics,
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 24.0),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Navigator.pushNamed(
                              context,
                              SubscribeView.routeName,
                            );
                            break;
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: boxShadow,
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: Icon(controller.icons[index]),
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                color: Color(0xFFF0F0F0),
                                shape: BoxShape.circle,
                              ),
                            ),
                            context.widthBox(20),
                            Text(
                              controller.actions[index],
                              style: GoogleFonts.montserrat(
                                color: AppColors.ash,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: controller.actions.length,
                  shrinkWrap: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
