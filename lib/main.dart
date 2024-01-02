import 'package:flutter/material.dart';

import 'package:cinemapedia_app/config/router/app_router.dart';
import 'package:cinemapedia_app/config/theme/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future main() async{
  await dotenv.load(fileName: ".env");
  runApp(
    const ProviderScope(child: MyApp())
  );  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Cinemapedia App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      routerConfig: appRouter,    
    );
  }
}