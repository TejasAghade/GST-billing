import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shop_management/core/theme/app_pallet.dart';

Future<dynamic> alert({
    required BuildContext context, 
    required QuickAlertType type, 
    required String text, double? width
  }){
  return QuickAlert.show(
    width: 300,
    context: context,
    type: type,
    text: text,
    confirmBtnColor: Pallet.primaryColor
  );
}