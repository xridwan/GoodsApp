import 'package:flutter/material.dart';
import 'package:goods_app/data/response/status_response.dart';

class DropDownStatusWidget extends StatefulWidget {
  final String title;
  final String? value;
  final List<StatusResponse> items;
  final ValueChanged<String?> onChanged;
  final String hint;

  const DropDownStatusWidget({
    super.key,
    required this.title,
    required this.items,
    required this.onChanged,
    this.value,
    this.hint = "Select item",
  });

  @override
  State<DropDownStatusWidget> createState() => _DropDownStatusWidgetState();
}

class _DropDownStatusWidgetState extends State<DropDownStatusWidget> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    final selectedItemName = widget.items
        .firstWhere(
          (item) => item.id == widget.value,
          orElse: () => StatusResponse(id: "", name: null),
        )
        .name;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Container(
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.blue.shade300, width: 2),
          ),
          child: InkWell(
            onTap: () {
              setState(() => isOpen = !isOpen);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedItemName ?? widget.hint,
                  style: TextStyle(
                    fontSize: 14,
                    color: selectedItemName == null
                        ? Colors.blueGrey
                        : Colors.black,
                  ),
                ),
                Icon(
                  isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: Colors.grey.shade700,
                ),
              ],
            ),
          ),
        ),

        // List dropdown custom
        if (isOpen) ...[
          const SizedBox(height: 8),
          Container(
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListView.builder(
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                return InkWell(
                  onTap: () {
                    widget.onChanged(item.id);
                    setState(() => isOpen = false);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      item.name ?? "",
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}
