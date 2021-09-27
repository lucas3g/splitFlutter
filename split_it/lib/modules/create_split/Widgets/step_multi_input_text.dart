import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import 'package:split_it/modules/create_split/Widgets/step_input_text.dart';

class StepMultiInputText extends StatefulWidget {
  final int count;
  final String? initialName;
  final double? initialValue;
  final ValueChanged<String> itemName;
  final ValueChanged<double> itemValue;
  final VoidCallback? onDelete;
  final bool isRemoved;

  StepMultiInputText({
    Key? key,
    required this.count,
    required this.itemName,
    required this.itemValue,
    this.isRemoved = false,
    this.initialName,
    this.initialValue,
    this.onDelete,
  }) : super(key: key);

  @override
  State<StepMultiInputText> createState() => _StepMultiInputTextState();
}

class _StepMultiInputTextState extends State<StepMultiInputText> {
  late MoneyMaskedTextController valueInputTextController =
      MoneyMaskedTextController(
          initialValue: widget.initialValue ?? 0.00,
          leftSymbol: 'R\$',
          decimalSeparator: ',');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.isRemoved ? EdgeInsets.zero : EdgeInsets.only(right: 24),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('${widget.count}'),
          ),
          Expanded(
            flex: 2,
            child: StepInputText(
              initialValue: widget.initialName,
              padding: EdgeInsets.zero,
              onChange: (value) {
                widget.itemName(value);
              },
              hintext: 'Ex: Picanha',
              align: TextAlign.start,
            ),
          ),
          Expanded(
            child: StepInputText(
              controller: valueInputTextController,
              padding: EdgeInsets.zero,
              onChange: (value) {
                widget.itemValue(valueInputTextController.numberValue);
              },
              hintext: 'R\$ 0,00',
              align: TextAlign.end,
              type: TextInputType.number,
            ),
          ),
          if (widget.isRemoved)
            IconButton(
                onPressed: () {
                  widget.onDelete!();
                },
                icon: Icon(Icons.delete_forever)),
        ],
      ),
    );
  }
}
