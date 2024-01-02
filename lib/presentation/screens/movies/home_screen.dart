import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
 const _HomeView();

 @override
 Widget build(BuildContext context) {
   return const Center(
     child: Text('HomeView'),
   );
 }
}