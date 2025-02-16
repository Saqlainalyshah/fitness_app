import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import '../app_color/color.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({
    super.key,
    required this.value,
    required this.list,
    required this.onChanged,
  });

  final String value;
  final List<String> list;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15,),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300), // Light grey border
        borderRadius: BorderRadius.circular(30), // Rounded corners
        color: Colors.white, // Ensures background consistency
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: AppColor.secondaryColor,
          value: value,
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black54), // Dropdown arrow
          style: const TextStyle(fontSize: 16, color: Colors.black),
          onChanged: onChanged,
          items: list.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: TextWidget(text: item, fontSize: 16,isBold: true,),
            );
          }).toList(),
        ),
      ),
    );
  }
}
