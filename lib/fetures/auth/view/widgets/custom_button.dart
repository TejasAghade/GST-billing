import 'package:flutter/material.dart';
import 'package:shop_management/core/theme/app_pallet.dart';

class CustomAuthButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const CustomAuthButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 55),
        backgroundColor: Pallet.primaryColor,
        shadowColor: Pallet.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Pallet.white,
          fontSize: 18,
          fontWeight: FontWeight.w800,
          letterSpacing: 2,
        ),
      ),
    );
  }
}
