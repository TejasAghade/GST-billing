import 'package:go_router/go_router.dart';
import 'package:shop_management/fetures/auth/view/pages/signin_page.dart';
import 'package:shop_management/fetures/auth/view/pages/signup_page.dart';


final GoRouter customRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const SignupScreen(),
      ),
      routes: <RouteBase>[
        GoRoute(
          path: 'signin',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const SignInScreen(),
          ),
        ),
      ],
    ),
  ],
);