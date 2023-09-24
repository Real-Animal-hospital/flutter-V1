import 'package:animal_hospital/login/presentation/login_screen_view.dart';
import 'package:animal_hospital/siginup/presentation/email_signup_screen_view.dart';
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
  ],
);
