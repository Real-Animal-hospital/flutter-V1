import 'package:animal_hospital/auth/login/presentation/found_id_passoword_screen_view.dart';
import 'package:animal_hospital/auth/login/presentation/login_screen_view.dart';
import 'package:animal_hospital/auth/siginup/presentation/email_signup_screen_view.dart';
import 'package:animal_hospital/components/bottom_navigation_widget.dart';
import 'package:animal_hospital/home/dogdrNews/presentation/news_screen_view.dart';
import 'package:animal_hospital/intro_view/introduce/presentation/introduce_screen_view.dart';
import 'package:animal_hospital/intro_view/splash/presentation/splash_first_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashFirstScreen();
      },
    ),
    GoRoute(
      path: '/emailsignup',
      builder: (BuildContext context, GoRouterState state) {
        return const EmailSignUpScreen();
      },
    ),
    GoRoute(
      path: '/foundid',
      builder: (BuildContext context, GoRouterState state) {
        return const FoundIdPassword();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const DogDrBottomNavigationWidget();
      },
    ),
    GoRoute(
      path: '/intro',
      builder: (BuildContext context, GoRouterState state) {
        return const IntroduceScreenView();
      },
    ),
    GoRoute(
      path: '/news',
      builder: (BuildContext context, GoRouterState state) {
        return const NewsScreenView();
      },
    ),
  ],
);
