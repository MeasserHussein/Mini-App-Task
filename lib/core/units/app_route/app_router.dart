

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../featured/onboarding/onboarding_screen.dart';
import '../../../featured/product/domain/entities/product_entity.dart';
import '../../../featured/product/ui/manager/details_cubit/details_cubit.dart';
import '../../../featured/product/ui/manager/product_cubit/product_cubit.dart';
import '../../../featured/product/ui/screens/details_view.dart';
import '../../../featured/product/ui/screens/product_view.dart';
import '../../../featured/splash/splash_screen.dart';
import '../../di/depency_injection.dart';
import 'app_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) =>
            SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) =>
            OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.product,
        builder: (context, state) =>
            BlocProvider(
              create: (context) =>
              getIt<ProductCubit>()
                ..getProduct(),
              child: ProductView(),
            ),
      ),
      // GoRoute(
      //   path: '/onboarding',
      //   builder: (context, state) => const OnboardingScreen(),
      // ),
      // GoRoute(
      //   path: '/products',
      //   builder: (context, state) => const ProductView(),
      // ),
      GoRoute(
          path: AppRoutes.details,
          builder: (context, state) {
            final product = state.extra as ProductEntity;
            final id = product.productId;
          return  BlocProvider(
              create: (context) => getIt<DetailsCubit>()..getDetails(id),
              child: DetailsView(),
            );
          }
      ),
    ],
  );
}