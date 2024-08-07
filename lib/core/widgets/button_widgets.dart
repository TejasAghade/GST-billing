import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_management/core/providers/sidebar_notifier.dart';
import 'package:shop_management/core/theme/app_pallet.dart';

class PrimaryBtn extends StatefulWidget {
  final String text;
  final void Function()? onPressed;
  final Icon? icon;
  final double borderRadius;
  const PrimaryBtn({super.key, required this.text, required this.onPressed, this.icon, this.borderRadius = 5});

  @override
  State<PrimaryBtn> createState() => _PrimaryBtnState();
}

class _PrimaryBtnState extends State<PrimaryBtn> {
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: widget.onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: Pallet.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
      ),
      child: widget.icon?? Text(widget.text),
    );
  }
}


class CustomListTile extends ConsumerStatefulWidget {

  final Icon? icon;
  final double minTileHeight;
  final Color hoverColor;
  final String text;
  final void Function()? onTap;
  final int id;


  const CustomListTile({ 
    super.key, 
    this.icon, 
    this.minTileHeight = 50, 
    this.hoverColor = Pallet.primaryHoverColor,
    required this.id,
    required this.text, 
    required this.onTap, 
  });

  @override
  ConsumerState<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends ConsumerState<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    
    bool isSelected = ref.watch(sidebarNotifierProvider).selectedTile == widget.id;

    return  ListTile(
      selected: isSelected,
      selectedColor: Pallet.primaryColor,
      selectedTileColor: widget.hoverColor,
      hoverColor: isSelected? null : widget.hoverColor,
      minTileHeight: widget.minTileHeight,
      onTap: (){
        ref.read(sidebarNotifierProvider).selectTile(widget.id);
        widget.onTap!();
      },
      leading: widget.icon,
      title: Text(widget.text,),
    );
  }
}