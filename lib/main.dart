import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:islam_pedia/generated/colors.gen.dart';
import 'package:islam_pedia/generated/fonts.gen.dart';
import 'package:islam_pedia/presentation/main/daily_prayer/daily_prayer_page.dart';
import 'package:islam_pedia/presentation/main/encyclopedia/data/encyclopedia_model.dart';
import 'package:islam_pedia/presentation/main/encyclopedia/encyclopedia_detail_page.dart';
import 'package:islam_pedia/presentation/main/encyclopedia/encyclopedia_page.dart';
import 'package:islam_pedia/presentation/main/home/home_page.dart';
import 'package:islam_pedia/presentation/main/main_application_page.dart';
import 'package:islam_pedia/presentation/main/settings/settings_page.dart';
import 'package:islam_pedia/presentation/onboarding/onboarding_page.dart';
import 'package:islam_pedia/presentation/others/splash_page.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        name: 'onboarding',
        path: '/onboarding',
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingPage();
        },
      ),
      GoRoute(
        name: 'main',
        path: '/main/:id',
        builder: (BuildContext context, GoRouterState state) {
          return MainApplicationPage(
            updateIndex: state.params['id'],
          );
        },
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
      GoRoute(
        name: 'dailyprayer',
        path: '/dailyprayer',
        builder: (BuildContext context, GoRouterState state) {
          return const DailyPrayerPage();
        },
      ),
      GoRoute(
          name: 'encyclopedia',
          path: '/encyclopedia',
          builder: (BuildContext context, GoRouterState state) {
            return const EncyclopediaPage();
          },
          routes: [
            GoRoute(
              name: 'encyclopedia-detail',
              path: 'detail/:title',
              builder: (BuildContext context, GoRouterState state) {
                final title = state.params['title'];
                return EncyclopediaDetailPage(
                  data: EncyclopediaModel.items
                      .firstWhere((e) => e.title == title),
                );
              },
            ),
          ]),
      GoRoute(
        name: 'settings',
        path: '/settings',
        builder: (BuildContext context, GoRouterState state) {
          return const SettingsPage();
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MaterialApp.router(
            builder: (context, child) {
              return ResponsiveWrapper.builder(
                child ?? BouncingScrollWrapper.builder(context, child!),
                minWidth: 450,
                maxWidth: 1200,
                defaultScale: true,
                breakpoints: [
                  const ResponsiveBreakpoint.resize(450, name: MOBILE),
                  const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                  const ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
                ],
                background: Container(color: Colors.white),
              );
            },
            theme: ThemeData(
              fontFamily: FontFamily.inter,
              primaryColor: ColorName.yellow,
              appBarTheme: AppBarTheme(
                color: ColorName.yellow,
                foregroundColor: Colors.black,
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  primary: ColorName.yellow,
                  textStyle: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            routerDelegate: _router.routerDelegate,
            routeInformationParser: _router.routeInformationParser,
            routeInformationProvider: _router.routeInformationProvider,
          );
        },
      ),
    );
  }
}
