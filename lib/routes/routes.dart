//import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:noti/modules/auth/screens/home_screen.dart';
import 'package:noti/modules/auth/screens/init_screen.dart';
import 'package:noti/modules/auth/screens/login_screen.dart';
import 'package:noti/modules/auth/screens/register_screen.dart';


final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => InitScreen()),
    GoRoute(path: '/home', builder: (context, state) =>  HomeScreen()),
    GoRoute(path: '/login', builder: (context, state) =>  LoginScreen()),
    GoRoute(path: '/register', builder: (context, state) => RegisterScreen()),
  ],
);
