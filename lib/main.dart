import 'dart:io';

import 'package:chat_generator/core/http_certificate_manager.dart';
import 'package:chat_generator/features/app/home/home_page.dart';
import 'package:chat_generator/features/app/route/on_genrate_route.dart';
import 'package:chat_generator/features/app/splash/splash_screen.dart';
import 'package:chat_generator/features/text_completion/presentation/cubit/text_completion_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TextCompletionCubit>(
            create: (_) => di.sl<TextCompletionCubit>() ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat AI',
        onGenerateRoute: OnGenerateRoute.route,
        theme: ThemeData(brightness: Brightness.dark),
        initialRoute: '/',
        routes: {
          "/": (context) {
            return const SplashScreen(
              child: HomePage(),
            );
          }
        },
      ),
    );
  }
}
