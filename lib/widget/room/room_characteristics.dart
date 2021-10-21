import 'package:flutter/material.dart';
import 'package:studion_mobile/model/room_dto.dart';

class RoomCharacteristics extends StatelessWidget {
  final RoomItem item;

  const RoomCharacteristics(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 5,
        right: 5,
        top: 10,
      ),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              bottom: 8,
            ),
            alignment: AlignmentDirectional.topStart,
            child: const Text(
              "Характеристики",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8.0),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.apartment),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${item.area} м2',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.vertical_align_top),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${item.height / 10} м',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // child: Column(
          //   children: [
          //     Container(
          //       alignment: AlignmentDirectional.topStart,
          //       child: const Text(
          //         "Характеристики",
          //         style: TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //     Row(
          //       children: [
          //         Table(
          //           border: TableBorder.all(),
          //           defaultColumnWidth: IntrinsicColumnWidth(),
          //           children: [
          //             TableRow(children: [
          //               Expanded(
          //                 flex: 1,
          //                 child: Row(
          //                   children: [
          //                     Icon(Icons.apartment),
          //                     Text(
          //                       '${item.area} м2',
          //                       style: TextStyle(
          //                         fontSize: 18,
          //                       ),
          //                     )
          //                   ],
          //                 ),
          //               ),
          //               Expanded(
          //                 flex: 1,
          //                 child: Row(
          //                   children: [
          //                     Icon(Icons.apartment),
          //                     Text(
          //                       '${item.area} м2',
          //                       style: TextStyle(
          //                         fontSize: 18,
          //                       ),
          //                     )
          //                   ],
          //                 ),
          //               ),
          //             ]),
          //           ],
          //         )
          //       ],
          //     )
        ],
      ),
    );
  }
}
