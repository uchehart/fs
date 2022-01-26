import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  final String? address;
  final String? state;
  final String? phone;
  final int addressSelect;

  const AddressCard(
      {Key? key,
      this.address,
      this.state,
      this.phone,
      required this.addressSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
