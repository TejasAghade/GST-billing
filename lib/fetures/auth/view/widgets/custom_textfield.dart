import 'package:flutter/material.dart';

class CustomAuthTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final List<Widget>? suffixIcon;
  final bool enabled;
  const CustomAuthTextField({
    super.key,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.enabled = true,
  });

  @override
  State<CustomAuthTextField> createState() => _CustomAuthTextFieldState();
}

class _CustomAuthTextFieldState extends State<CustomAuthTextField> {
  bool obsecureText = false;
  @override
  void initState() {
    super.initState();
    obsecureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
        hintText: widget.hintText ?? "",
        suffixIcon: widget.suffixIcon == null ? null
          : IconButton(
              onPressed: () {
                setState(() {
                  obsecureText = !obsecureText;
                });
              },
              icon: obsecureText ? widget.suffixIcon![0] : widget.suffixIcon![1],
            ),
      ),
      validator: (value){
        if(value!.isEmpty){
          return "${widget.hintText} is missing!";
        }
        return null;
      },
    );
  }
}
