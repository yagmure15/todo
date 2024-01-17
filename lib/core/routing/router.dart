import 'package:auto_route/auto_route.dart';
import 'package:todo_app/core/routing/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: AppHandler.page,
          initial: true,
          path: '/app-handler',
          children: [
            AutoRoute(
              page: HomeRoute.page,
            ),
            AutoRoute(
              page: SignInRoute.page,
            ),
          ],
        ),
      ];
}
