// ignore_for_file: must_be_immutable

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:shop_management/core/theme/app_pallet.dart';

class CustomDatepickerWidget extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool enabled;
  final Function(String)? onChanged;
  final Function()? onSuffixClick;
  final String? lable;
  final double? height;
  final double? width;

  DateTime? selectedDate;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;

  CustomDatepickerWidget({
    super.key,
    this.hintText,
    this.controller,
    this.suffixIcon,
    this.enabled = true,
    this.onChanged,
    this.onSuffixClick,
    this.lable,
    this.height,
    this.width, 

    this.initialDate, 
    this.firstDate, 
    this.lastDate, 
    this.selectedDate
  });

  @override
  State<CustomDatepickerWidget> createState() => _CustomDatepickerWidgetState();
}

class _CustomDatepickerWidgetState extends State<CustomDatepickerWidget> {

  List<DateTime?>? results = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.lable != null) Text(widget.lable!),
        if(widget.lable != null) const SizedBox(height: 8,),
        SizedBox(
          width: widget.width ?? 300,
          height: widget.height?? 40,
          child: TextFormField(
            readOnly: true,
            controller: widget.controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              hintText: widget.hintText ?? "",
              suffixIcon: widget.suffixIcon == null ? null
                : IconButton(
                    onPressed: widget.onSuffixClick,
                    icon: widget.suffixIcon!,
                  ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  width: 2,
                  color: Pallet.gray
                )
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  width: 2,
                  color: Pallet.gray
                )
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  width: 2,
                  color: Pallet.gray
                )
              ),
            ),
            onChanged: (value) async{

            },
            onTap: () async{
              // _selectDate();
              results = await showCalendarDatePicker2Dialog(
                context: context,
                config: CalendarDatePicker2WithActionButtonsConfig(
                  firstDate: widget.firstDate ?? DateTime.now(),
                  lastDate: widget.lastDate ?? DateTime.now().add(const Duration(days: 10)),
                  currentDate: widget.initialDate ?? DateTime.now()
                ),
                dialogSize: const Size(325, 400),
                value: [widget.selectedDate],
                borderRadius: BorderRadius.circular(15),
              );
              if(results!.isNotEmpty){
                if(results![0] != null){
                  widget.selectedDate = results![0];
                  widget.controller!.text = "${results![0]!.day}-${results![0]!.month}-${results![0]!.year}";
                }
              }
            },
          ),
        ),
      ],
    );
  }

}