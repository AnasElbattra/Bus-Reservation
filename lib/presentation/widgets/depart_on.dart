import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gobusss/presentation/presentation_contatiner.dart';
import 'package:intl/intl.dart';

class DepartOn extends StatelessWidget {
  final DateTime? selectedDate;
  final void Function() onPressed;

  const DepartOn({this.selectedDate, required this.onPressed});

  // void _presentDatePicker() {
  //   showDateRangePicker(
  //     context: context,
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(2099),
  //   );
  //   showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(2099),
  //   ).then((pickDate) {
  //     if (pickDate == null) return;
  //     setState(() {
  //       _selectedDate = pickDate;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              style: const ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap),
              onPressed: onPressed,
              icon: const Icon(
                Icons.calendar_today_outlined,
              ),
              label: Text(
                StringManager.departOn.tr(),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        FittedBox(
          child: TextButton(
            style: const ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: onPressed, // _presentDatePicker,
            child: Text(
              (selectedDate == null
                  ? DateFormat.MMMMEEEEd().format(DateTime.now())
                  : DateFormat.MMMMEEEEd().format(selectedDate!)),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
