import 'package:flutter/material.dart';
import 'package:shop_management/core/theme/app_pallet.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool enabled;
  final Function(String)? onChanged;
  final Function()? onSuffixClick;
  final Function(String)? onSubmitted;
  final String? lable;
  final double? height;
  final double? width;
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.controller,
    this.suffixIcon,
    this.enabled = true,
    this.onChanged,
    this.onSuffixClick,
    this.onSubmitted,
    this.lable,
    this.height,
    this.width,
  });

  @override
  State<CustomTextFormField> createState() => _CustomAuthTextFieldState();
}

class _CustomAuthTextFieldState extends State<CustomTextFormField> {
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
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onSubmitted,
          ),
        ),
      ],
    );
  }
}
