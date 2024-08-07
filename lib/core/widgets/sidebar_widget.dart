import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_management/core/constants/sizes.dart';
import 'package:shop_management/core/theme/app_pallet.dart';
import 'package:shop_management/core/widgets/button_widgets.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 15),
      decoration: const BoxDecoration(
        border: Border(right: BorderSide(width: 1.5, color: Pallet.borderColor2))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: Pallet.borderColorDark))
            ),
            child: CustomListTile(
              id: 0,
              minTileHeight: 60,
              onTap: (){
                context.go('/');
              },
              icon: const Icon(Icons.shopify_outlined, color: Pallet.green, size: 34,),
              text:"Shop",
            ),
          ),
          height20(),
          Expanded(
            child: ListView(
              children: [
                CustomListTile(
                  id: 1,
                  onTap: (){
                    context.go('/');
                  },
                  icon: const Icon(Icons.dashboard_outlined, size: 24,),
                  text:"Dashboard",
                ),
                const SizedBox(height: 10,),
                CustomListTile(
                  id: 2,
                  onTap: (){
                    context.go('/entries');
                  },
                  icon: const Icon(CupertinoIcons.list_bullet_below_rectangle, size: 24,),
                  text: "Entries",
                ),
                const SizedBox(height: 10,),
                CustomListTile(
                  id: 3,
                  onTap: (){
                    context.go('/billing');
                  },
                  icon: const Icon(CupertinoIcons.money_dollar_circle, size: 24,),
                  text: "Billing",
                ),
                const SizedBox(height: 10,),
                CustomListTile(
                  id: 4,
                  onTap: (){
                    context.go('/clients');
                  },
                  icon: const Icon(CupertinoIcons.person_2, size: 24,),
                  text: "Clients",
                ),
              ],
            ),
          ),
          CustomListTile(
            id: 9,
            onTap: (){
              context.go('/settings');
            },
            icon: const Icon(Icons.settings, size: 24,),
            text: "Settings",
          ),
        ],
      ),
    );
  }
}