import 'package:flutter/material.dart';

class AddressInfo extends StatelessWidget {
  final String address;

  const AddressInfo(this.address) : super(key: const Key('address'));

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(
              right: 15,
            ),
            child: Text(
              address,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black12,
            ),
            child: const Icon(Icons.location_on_outlined),
          )
        ],
      ),
    );
  }
}
