import 'package:flutter/material.dart';

class AddressBlock extends StatelessWidget {
  final String address;

  const AddressBlock(this.address);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topStart,
      child: Padding(
        child: Row(
          children: [
            const Icon(Icons.house),
            Text(
              ' ' + address,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
          top: 5,
        ),
      ),
    );
  }
}
