import 'package:flutter/material.dart';
import 'package:flutter_app_bate_ponto/src/model/registro_ponto.dart';
import 'package:flutter_app_bate_ponto/src/widgets/selector/mes_selector_state.dart';

class EspelhoPontoListView extends StatefulWidget {
  final List<RegistroPonto> items;

  const EspelhoPontoListView({super.key, required this.items});

  @override
  State<EspelhoPontoListView> createState() => _EspelhoPontoListViewState();
}

class _EspelhoPontoListViewState extends State<EspelhoPontoListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MesSelector(),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title:
                    Text(widget.items[index].dataHoraRegistroPonto.toString()),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
      ],
    );
  }
}
