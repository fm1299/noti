//import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:noti/modules/auth/screens/home_screen.dart';
import 'package:noti/modules/auth/screens/login_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => LoginScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
  ],
);
