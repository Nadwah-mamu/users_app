import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Controller/provider_class.dart';
import 'View/home_page.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (BuildContext context) => ProviderClass(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

