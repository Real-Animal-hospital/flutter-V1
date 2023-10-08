import 'package:animal_hospital/auth/login/presentation/found_id_passoword_screen_view.dart';
import 'package:animal_hospital/auth/login/presentation/login_screen_view.dart';
import 'package:animal_hospital/auth/siginup/presentation/email_signup_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
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
  ],
);
