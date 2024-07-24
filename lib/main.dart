import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_management/core/config/router_config.dart';
import 'package:shop_management/core/theme/app_theme.dart';
import 'package:shop_management/fetures/auth/viewmodel/auth_viewmodel.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  await container.read(authViewModelProvider.notifier).initSharedPrefrences();
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const ShopCrm()
    )
  );
}

class ShopCrm extends StatelessWidget {
  const ShopCrm({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Shop Management',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeMode,
      routerConfig: customRouter,
    );
  }
}

