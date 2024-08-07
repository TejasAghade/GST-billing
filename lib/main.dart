import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_management/core/config/router_config.dart';
import 'package:shop_management/core/providers/current_user_notifier.dart';
import 'package:shop_management/core/theme/app_theme.dart';
import 'package:shop_management/fetures/auth/viewmodel/auth_viewmodel.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async{
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();

  await container.read(authViewModelProvider.notifier).initSharedPrefrences();
  await container.read(authViewModelProvider.notifier).getData();
  
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const ShopCrm()
    )
  );
}

class ShopCrm extends ConsumerStatefulWidget {
  const ShopCrm({super.key});
  @override
  ConsumerState<ShopCrm> createState() => _ShopCrmState();
}

class _ShopCrmState extends ConsumerState<ShopCrm> {
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserNotifierProvider);
    return MaterialApp.router(
      title: 'Shop Management',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeMode,
      routerConfig: currentUser == null? customRouter : secureRoutes,
    );
  }
}



