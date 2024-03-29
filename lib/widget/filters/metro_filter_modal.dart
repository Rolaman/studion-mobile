import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/metro_dto.dart';
import 'package:studion_mobile/provider/filters_provider.dart';
import 'package:studion_mobile/provider/metro_provider.dart';

class MetroFiltersModal extends StatefulWidget {
  @override
  _MetroFiltersModalState createState() => _MetroFiltersModalState();
}

class _MetroFiltersModalState extends State<MetroFiltersModal> {
  Set<String> _checked = {};
  bool _inited = false;
  final _textController = TextEditingController();
  List<MetroStationItem> _allMetros = [];
  List<MetroStationItem> _shownMetros = [];

  @override
  void didChangeDependencies() {
    if (!_inited) {
      _allMetros = Provider.of<MetroProvider>(context, listen: false)
          .get();
      setState(() {
        _shownMetros = [..._allMetros];
        _checked = Provider.of<FiltersProvider>(context, listen: false)
            .getMetroFilterIds()
            .toSet();
        _inited = true;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<FiltersProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          alignment: AlignmentDirectional.topStart,
          margin: const EdgeInsets.only(
            left: 12,
            right: 15,
          ),
          child: TextField(
            style: const TextStyle(
              fontSize: 20,
            ),
            textAlignVertical: TextAlignVertical.center,
            autocorrect: false,
            enableSuggestions: false,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.search,
            onChanged: (value) {
              setState(() {
                _shownMetros = _allMetros
                    .where((e) =>
                        e.name.toLowerCase().contains(value.toLowerCase()))
                    .toList();
              });
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                top: 2,
                bottom: 2,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              fillColor: Colors.white,
              filled: true,
              prefixIcon: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _shownMetros = [..._allMetros];
                  });
                  FocusScope.of(context).unfocus();
                  _textController.clear();
                },
              ),
            ),
            controller: _textController,
          ),
        ),
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                _checked.clear();
                _shownMetros = [..._allMetros];
              });
              _textController.clear();
              FocusScope.of(context).unfocus();
              filterProvider.discardMetro();
            },
            child: Container(
              padding: const EdgeInsets.only(
                right: 10,
              ),
              alignment: AlignmentDirectional.center,
              child: const Text('Сбросить'),
            ),
          )
        ],
      ),
      body: Container(
        alignment: AlignmentDirectional.topCenter,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: _shownMetros.map((e) {
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
                    filterProvider.changeMetro(e, !state);
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
                                filterProvider.changeMetro(e, state!);
                              },
                            )),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: e.color,
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
      ),
    );
  }
}
