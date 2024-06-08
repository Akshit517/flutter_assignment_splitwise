import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splitwise/app/views/screens/add_expense.dart';
import 'package:splitwise/app/views/screens/home/home_screen.dart';
import 'package:splitwise/app/views/screens/auth/option_loginsignup_screen.dart';
import 'package:splitwise/app/views/screens/expense.dart';
import 'package:splitwise/app/views/screens/settle%20up/done_settle_up.dart';
import 'package:splitwise/app/views/screens/settle%20up/settleup_screen.dart';
import 'package:splitwise/app/views/screens/auth/auth_screen.dart';
import 'package:splitwise/app/views/screens/splashscreen.dart';

GoRouter routes = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: "/",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const SplashScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      name: "Option",
      path: '/option',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const LoginSignupOptionScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      name: "Login",
      path: '/login',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const AuthScreen(isLoginScreen: true),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      name: "Sign up",
      path: '/signup',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const AuthScreen(isLoginScreen: false),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      name: "Add Expense",
      path: '/add',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const AddExpenseScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(scale: animation, alignment: Alignment.bottomRight, child: child);
          },
        );
      },
    ),
    GoRoute(
      name: "Home",
      path: '/home',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(scale: animation, child: child);
          },
        );
      },
      routes: [
        GoRoute(
          path: "expense/:isGroup/:name/:amount",
          pageBuilder: (context, state) {
            final isGroup = state.pathParameters['isGroup']!.toLowerCase() == 'true';
            final name = state.pathParameters['name']!;
            final description = state.uri.queryParameters['description']!;
            final amount = state.pathParameters['amount']!;
            final statusColor = Color(int.parse(state.uri.queryParameters['statusColor']!));
            final icon = state.uri.queryParameters['icon'];

            return CustomTransitionPage(
              key: state.pageKey,
              child: ExpenseScreen(
                isGroup: isGroup,
                name: name,
                description: description,
                amount: amount,
                statusColor: statusColor,
                icon: icon,
              ),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            );
          },
          routes: [
            GoRoute(
              path: "settle_up",
              pageBuilder: (context, state) {
                final parentParams = state.extra as Map<String, dynamic>?;

                if (parentParams == null) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: const Scaffold(
                      body: Center(child: Text("No parameters passed from parent")),
                    ),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  );
                }

                final isGroup = parentParams['isGroup'] as bool;
                final name = parentParams['name'] as String;
                final amount = parentParams['amount'] as String;
                final status = parentParams['status'] as String;

                return CustomTransitionPage(
                  key: state.pageKey,
                  child: SettleupScreen(
                    name: name,
                    amount: amount,
                    isGroup: isGroup,
                    status: status,
                  ),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                );
              },
              routes: [
                GoRoute(
                  path: 'done',
                  pageBuilder: (context, state) {

                    final String parentParam = state.extra as String;

                    final String name = parentParam;

                    return CustomTransitionPage(
                      key: state.pageKey,
                      child: DoneSettleUp(
                        name : name
                      ),
                      transitionsBuilder: (context, animation, secondaryAnimation, child){
                        return FadeTransition(opacity: animation, child: child,);
                      }
                      );
                  },)
              ]
            ),
          ],
        ),
      ],
    ),
  ],
);
