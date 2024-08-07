import 'package:flutter/material.dart';
import 'package:shop_management/core/theme/app_pallet.dart';

TextStyle customText({double? size, FontWeight? fontWeight, Color? color}){
  return TextStyle(
    fontSize: size??14,
    color: color?? Pallet.dark,
    fontWeight: fontWeight?? FontWeight.w400,
  );
}

TextStyle regularText = const TextStyle(
  fontSize: 14,
  color: Pallet.dark
);

TextStyle regularTextMedium = const TextStyle(
  fontSize: 14,
  color: Pallet.dark,
  fontWeight: FontWeight.w600
);

TextStyle regularTextBold = const TextStyle(
  fontSize: 14,
  color: Pallet.dark,
  fontWeight: FontWeight.bold
);

TextStyle mediumText = const TextStyle(
  fontSize: 16,
  color: Pallet.dark
);

TextStyle mediumTextMedium = const TextStyle(
  fontSize: 16,
  color: Pallet.dark,
  fontWeight: FontWeight.w600
);

TextStyle mediumTextBold = const TextStyle(
  fontSize: 16,
  color: Pallet.dark,
  fontWeight: FontWeight.bold
);