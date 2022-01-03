import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodsub/ui/views/screens/address/address.dart';
import 'package:foodsub/ui/views/shared/colors.dart';
import 'package:foodsub/ui/views/shared/style.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({Key? key}) : super(key: key);
  static const routeName = "/delivery";

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  var _val = 1;
  @override
  Widget build(BuildContext context) {
    final controller = ChangeNotifier();
    final List<AddressCard> address = <AddressCard>[
      const AddressCard(
        address: 'Lekki Phase One',
        state: 'Lagos State',
        phone: '+2349066000000',
        addressSelect: 1,
      ),
      const AddressCard(
        address: 'Lekki Phase One',
        state: 'Lagos State',
        phone: '+2349066000000',
        addressSelect: 2,
      ),
      const AddressCard(
        address: 'Lekki Phase One',
        state: 'Lagos State',
        phone: '+2349066000000',
        addressSelect: 3,
      ),
    ];

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
              leading: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 14,
                  color: AppColors.black,
                ),
              ),
              title: Text(
                "Delivery Address",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  color: AppColors.ash,
                  fontSize: 18.0,
                ),
              )),
          body: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: address
                          .map((data) => Card(
                                shadowColor: Colors.grey,
                                elevation: 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Radio<int>(
                                          activeColor: const Color.fromRGBO(
                                              255, 169, 39, 1),
                                          value: data.addressSelect,
                                          groupValue: _val,
                                          onChanged: (value) {
                                            setState(() {
                                              _val = value!;
                                            });
                                          }),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.address!,
                                            style: AppTextStyles.subtitle,
                                          ),
                                          Text(data.state!,
                                              style: AppTextStyles.subtitle
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.normal)),
                                          Text(data.phone!,
                                              style: AppTextStyles.subtitle
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.normal)),
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: const [
                                          Icon(
                                            Icons.note_alt_outlined,
                                            size: 20,
                                          ),
                                          SizedBox(height: 20),
                                          Icon(
                                            Icons.delete_outlined,
                                            size: 20,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ))
                          .toList())),
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 20),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(255, 169, 39, 1)),
                      child: const Icon(
                        Icons.add_outlined,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
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
