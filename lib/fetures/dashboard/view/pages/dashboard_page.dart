import 'package:flutter/material.dart';
import 'package:shop_management/core/constants/sizes.dart';
import 'package:shop_management/core/widgets/sidebar_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SideBar(),
          width20(),
          const Center(
            child: Text("Dashboard"),
          ),
        ],
      ),
    );
  }
}