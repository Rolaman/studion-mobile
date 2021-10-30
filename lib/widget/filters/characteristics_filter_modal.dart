import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/provider/characteristics_provider.dart';
import 'package:studion_mobile/provider/filters_provider.dart';

class CharacteristicsFiltersModal extends StatefulWidget {
  @override
  _CharacteristicsFiltersModalState createState() =>
      _CharacteristicsFiltersModalState();
}

class _CharacteristicsFiltersModalState
    extends State<CharacteristicsFiltersModal> {
  Set<String> _checked = {};
  bool _inited = false;

  @override
  void didChangeDependencies() {
    if (!_inited) {
      setState(() {
        _checked = Provider.of<FiltersProvider>(context, listen: false)
            .getCharacteristicFilterIds()
            .toSet();
        _inited = true;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: FutureBuilder(
        future: Provider.of<CharacteristicProvider>(context).get(),
        builder: (ctx, AsyncSnapshot<List<CharacteristicItem>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            alignment: AlignmentDirectional.topCenter,
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: ListView(
              children: snapshot.data!.map((e) {
                return Column(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        final state = _checked.contains(e.id);
                        setState(() {
                          if (!state) {
                            _checked.add(e.id);
                          } else {
                            _checked.remove(e.id);
                          }
                        });
                        Provider.of<FiltersProvider>(context, listen: false)
                            .changeCharacteristic(e, !state);
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Transform.scale(
                              scale: 1.2,
                              child: Checkbox(
                                value: _checked.contains(e.id),
                                onChanged: (state) {
                                  setState(() {
                                    if (state!) {
                                      _checked.add(e.id);
                                    } else {
                                      _checked.remove(e.id);
                                    }
                                  });
                                  Provider.of<FiltersProvider>(context,
                                          listen: false)
                                      .changeCharacteristic(e, state!);
                                },
                              ),
                            ),
                            Text(
                              e.name,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ],
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
